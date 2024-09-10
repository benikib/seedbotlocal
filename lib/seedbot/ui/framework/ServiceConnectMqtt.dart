import 'dart:io';

import 'package:seedbot/seedbot/business/service/ServiceConnectCmd.dart';
import  'package:mqtt_client/mqtt_client.dart' ;
import  'package:mqtt_client/mqtt_server_client.dart' ;
import 'package:uuid/uuid.dart';

final clientId = Uuid().v4();

class ServiceConnectMqtt implements ServiceConnectCmd{
  final clientId = Uuid().v4();
  //MqttServerClient client = MqttServerClient('test.mosquitto.org', 'flutter_client_${DateTime.now().millisecondsSinceEpoch}');






  @override
  Future<String> abonner(data) {
    // TODO: implement abonner
    throw UnimplementedError();
  }




  @override
  Future<String> deconnexion(data) {


    return Future.value('ok');

  }

  @override
  Future<String> publication(data) {
    // TODO: implement publication
    throw UnimplementedError();
  }

  @override
  Future<String> connectId(data)  async{



    return "OK";


}
}









// Fonction callback appelée lorsque le client se connecte avec succès.

