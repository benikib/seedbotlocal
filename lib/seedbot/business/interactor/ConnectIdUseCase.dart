import 'package:seedbot/seedbot/business/service/ServiceConnectCmd.dart';

class ConnectIdUseCase{
  ServiceConnectCmd service;
  ConnectIdUseCase(this.service);

  Future<String> run(String id) async{
    return service.connectId(id);
  }
  Future<String> deconnexion(String id) async{
    return service.deconnexion(id);
  }
}