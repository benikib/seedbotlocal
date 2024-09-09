import '../service/SeedbotService.dart';

class LabourerUseCase{
  SeedbotService service;
  LabourerUseCase(this.service);
  Future<bool> run(bool value) async{
    return service.labourer(value);
  }
}