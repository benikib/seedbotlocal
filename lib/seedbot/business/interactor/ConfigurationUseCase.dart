import '../service/ServiceConnectCmd.dart';

class ConfigurationUseCase{

  ServiceConnectCmd service;

  ConfigurationUseCase(this.service);
  Future<String> run( data){

    return service.configuration(data);
  }
}