import 'dart:async';
import 'dart:io';

import 'package:seedbot/seedbot/business/service/ServiceConnectCmd.dart';
import  'package:mqtt_client/mqtt_client.dart' ;
import  'package:mqtt_client/mqtt_server_client.dart' ;





class ServiceConnectMqtt implements ServiceConnectCmd{
  late MqttServerClient client;




  @override
  Future<String> abonner(data) {
    // TODO: implement abonner
    throw UnimplementedError();
  }


  @override
  Future<String> deconnexion(id) async {
    String msg;

    if (this.client.connectionStatus!.state == MqttConnectionState.connected) {
      //return Future.value('Déconnexion du client MQTT...');

      // Déconnecter le client
      this.client.disconnect();

      print('Client MQTT déconnecté avec succès.');
        msg = 'Client MQTT déconnecté avec succès.';
    } else {
     print('Le client n\'est pas connecté, aucune déconnexion nécessaire.');
     msg = 'Le client n\'est pas connecté, aucune déconnexion …';

    }
    return Future.value(msg);
  }


  @override
  Future<String> publication(data) {
    // TODO: implement publication
    throw UnimplementedError();
  }

  @override
  Future<String> connectId(data)  async{

    this.client = MqttServerClient('test.mosquitto.org', 'flutter_client_${DateTime.now().millisecondsSinceEpoch}');

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

  @override
  Future<String> batterie2(dynamic data) async {
    String msg = ''; // Initialisation de la variable msg

    // Vérification si le client est connecté
    if (this.client.connectionStatus!.state == MqttConnectionState.connected) {
      print('MQTT client connected pour batterie ');

      // Abonnement au topic.
      client.subscribe('JessOut', MqttQos.atMostOnce);

      // Définir la fonction de callback pour traiter les messages reçus.
      client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> events) {
        for (var event in events) {
          // Traitement du message reçu via la fonction onMessageReceived
          // Traitement des messages reçus ici
          print('Message reçu sur le topic: ${event.topic}');
          final MqttPublishMessage recMessage = event.payload as MqttPublishMessage;
           msg =
          MqttPublishPayload.bytesToStringAsString(recMessage.payload.message);


        }
      });


    } else {
      // Si la connexion échoue
      print('ERROR: MQTT client connection failed - disconnecting, status is ${client.connectionStatus}');
      msg = "erreur de la connexion";
    }

    // Retourne le message en tant que Future
    return Future.value(msg);
  }





  Future<String> batterie(dynamic data) async {
    final completer = Completer<String>(); // Création du Completer

    // Vérification si le client est connecté
    if (this.client.connectionStatus!.state == MqttConnectionState.connected) {
      print('MQTT client connected pour batterie ');

      // Abonnement au topic.
      client.subscribe('JessOut', MqttQos.atMostOnce);

      // Définir la fonction de callback pour traiter les messages reçus.
      client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> events) {
        for (var event in events) {
          // Traitement du message reçu via la fonction onMessageReceived
          // Traitement des messages reçus ici
          print('Message reçu sur le topic: ${event.topic}');
          final MqttPublishMessage recMessage = event.payload as MqttPublishMessage;
          final msg = MqttPublishPayload.bytesToStringAsString(recMessage.payload.message);

          // Compléter le future avec le message reçu
          completer.complete(msg);
          return; // Quitte la boucle dès qu'un message est reçu
        }
      });

      // Optionnel: Timeout au cas où aucun message n'est reçu
      Timer(Duration(seconds: 10), () {
        if (!completer.isCompleted) {
          completer.completeError('Timeout: No message received');
        }
      });

    } else {
      // Si la connexion échoue
      print('ERROR: MQTT client connection failed - disconnecting, status is ${client.connectionStatus}');
      completer.completeError('erreur de la connexion');
    }

    // Retourne le Future du Completer
    return completer.future;
  }




  @override
  void SetSol(data) {
    // Vérification de l'état de la connexion après tentative.

    if (this.client.connectionStatus!.state == MqttConnectionState.connected) {
      const String topic = 'SolIn'; // Définition du topic auquel le client va s'abonner et publier.
    client.subscribe(topic, MqttQos.atMostOnce); // Abonnement au topic avec une qualité de service "atMostOnce" (Qos 0).

      final builder = MqttClientPayloadBuilder(); // Création d'un constructeur de payload pour le message MQTT.
      builder.addString("1"); // Ajout du texte "Hello MQTT" comme payload du message.

      // Publication du message sur le topic spécifié avec une qualité de service "exactlyOnce" (Qos 2).
    client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
    } else {
      // Affichage d'un message d'erreur si la connexion a échoué.
      print('ERROR: MQTT client connection failed - disconnecting, status is ${client.connectionStatus}');
     client.disconnect(); // Déconnexion du client en cas d'échec de la connexion.
    }


  }




}

main () async {
  ServiceConnectMqtt service = ServiceConnectMqtt();
  await service.connectId('id');
  service.SetSol('id');
}








// Fonction callback appelée lorsque le client se connecte avec succès.

