import 'dart:io';

import 'package:seedbot/seedbot/business/service/ServiceConnectCmd.dart';
import  'package:mqtt_client/mqtt_client.dart' ;
import  'package:mqtt_client/mqtt_server_client.dart' ;
import 'package:uuid/uuid.dart';

final clientId = Uuid().v4();

class ServiceConnectMqtt implements ServiceConnectCmd{
  final clientId = Uuid().v4();
  MqttServerClient client = MqttServerClient('test.mosquitto.org', 'flutter_client_${DateTime.now().millisecondsSinceEpoch}');






  @override
  Future<String> abonner(data) {
    // TODO: implement abonner
    throw UnimplementedError();
  }




  @override
  Future<String> deconnexion(data) {


    String topic = 'JessOut'; // Définition du topic auquel le client va s'abonner et publier.
    this.client.subscribe(topic, MqttQos.atMostOnce);

    this.client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });
    this.client.published!.listen((MqttPublishMessage message) {
      print(
          'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
    });
    return Future.value('ok');

  }

  @override
  Future<String> publication(data) {
    // TODO: implement publication
    throw UnimplementedError();
  }

  @override
  Future<String> connectId(data)  async{



    this.client.port = 1883;
    this.client.logging(on: true);
    this.client.keepAlivePeriod = 60;



    try {
    await client.connect(); // Tentative de connexion au broker. Cette méthode est asynchrone et attend la réponse du serveur.
    } catch (e) {
    print('Exception: $e'); // En cas d'échec de la connexion, l'exception est capturée et affichée.
    client.disconnect(); // Déconnexion du client en cas d'erreur.
    }

    // Vérification de l'état de la connexion après tentative.
    if (this.client.connectionStatus!.state == MqttConnectionState.connected) {
    print('MQTT client connected');
    return 'ok';
    } else {
    // Affichage d'un message d'erreur si la connexion a échoué.
    print('ERROR: MQTT client connection failed - disconnecting, status is ${client.connectionStatus}');
    this.client.disconnect(); // Déconnexion du client en cas d'échec de la connexion.
    return 'erreur de la connexion ';
    }


      return 'ok';
    // Attendre quelques secondes avant de se déconnecter pour laisser le temps aux messages d'être échangés

  }


}






void main() async {
// Création d'un client MQTT en spécifiant le serveur (broker) et un identifiant unique pour le client.
  MqttServerClient client = MqttServerClient('test.mosquitto.org', 'flutter_client_${DateTime.now().millisecondsSinceEpoch}');

  client.port = 1883; // Définition du port utilisé pour la connexion, 1883 est le port standard pour les connexions MQTT non sécurisées.
  client.logging(on: true); // Activation des logs pour suivre les événements MQTT.
  client.keepAlivePeriod = 60; // Définition de la période de keep alive (en secondes) pour maintenir la connexion active.

  // Définition des callbacks pour différents événements liés à la connexion.

  client.onDisconnected = onDisconnected; // Appelé lorsque le client se déconnecte.
  client.onSubscribed = onSubscribed; // Appelé lorsque le client s'abonne à un topic.
  client.onUnsubscribed = onUnsubscribed; // Appelé lorsque le client se désabonne d'un topic.
  client.onSubscribeFail = onSubscribeFail; // Appelé lorsque l'abonnement à un topic échoue.
  client.pongCallback = pong; // Appelé lorsque le client reçoit une réponse de ping du serveur (keep alive).

  try {
    await client.connect(); // Tentative de connexion au broker. Cette méthode est asynchrone et attend la réponse du serveur.
  } catch (e) {
    print('Exception: $e'); // En cas d'échec de la connexion, l'exception est capturée et affichée.
    client.disconnect(); // Déconnexion du client en cas d'erreur.
  }

  // Vérification de l'état de la connexion après tentative.
  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('MQTT client connected'); // Confirmation que le client est connecté.
  } else {
    // Affichage d'un message d'erreur si la connexion a échoué.
    print('ERROR: MQTT client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect(); // Déconnexion du client en cas d'échec de la connexion.
  }

  const String topic = 'JessIn'; // Définition du topic auquel le client va s'abonner et publier.
  client.subscribe(topic, MqttQos.atMostOnce); // Abonnement au topic avec une qualité de service "atMostOnce" (Qos 0).

  final builder = MqttClientPayloadBuilder(); // Création d'un constructeur de payload pour le message MQTT.
  builder.addString('Hello MQTT'); // Ajout du texte "Hello MQTT" comme payload du message.

  // Publication du message sur le topic spécifié avec une qualité de service "exactlyOnce" (Qos 2).
  client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);

  // Fonction pour gérer les messages entrants.
  void onMessageReceived(MqttReceivedMessage<MqttMessage> event) {
    final MqttPublishMessage message = event.payload as MqttPublishMessage;
    final String payload = MqttPublishPayload.bytesToStringAsString(message.payload.message);
    print('Message reçu: $payload sur le topic: ${event.topic}>');
    print('Message reçu: $payload sur le topic: ${event.topic}>');
  }

  // Abonnement au topic.
  client.subscribe('JessOut', MqttQos.atMostOnce);

  // Définir la fonction de callback pour traiter les messages reçus.
  client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> events) {
    for (var event in events) {
      onMessageReceived(event);

    }
  });

}

void onConnected() {
  print('Connected');
}

void onDisconnected() {
  print('Disconnected');
}

void onSubscribed(String topic) {
  print('Subscribed to $topic');
}

void onSubscribeFail(String topic) {
  print('Failed to subscribe $topic');
}

void pong() {
  print('Ping response client received');
}

void onUnsubscribed(String? topic) {
  print('Unsubscribed from $topic');
}



// Fonction callback appelée lorsque le client se connecte avec succès.

