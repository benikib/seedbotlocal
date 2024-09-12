import 'package:seedbot/seedbot/business/service/ServiceConnectCmd.dart';

class DeconnexionUseCase{
  ServiceConnectCmd service;
  DeconnexionUseCase(this.service);
  Future<String> deconnexion(String id) async{
    return await service.deconnexion(id);
  }
  Future<String> run(String id) async{
    return service.deconnexion(id);
  }

}