import '../service/ServiceConnectCmd.dart';

class DeplacementUseCase{

ServiceConnectCmd service;

  DeplacementUseCase(this.service);
  Future<String> run(data){
    return service.deplacement(data);
  }
}