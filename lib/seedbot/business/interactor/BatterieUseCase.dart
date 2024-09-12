import 'package:seedbot/seedbot/business/service/ServiceConnectCmd.dart';

class BatterieUseCase{
  ServiceConnectCmd service;
  BatterieUseCase(this.service);

  Future<String> run(String id) async{
    return service.batterie(id);
  }

}