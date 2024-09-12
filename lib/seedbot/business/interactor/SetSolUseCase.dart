import '../service/ServiceConnectCmd.dart';

class SetSolUseCase{
ServiceConnectCmd service;
SetSolUseCase(this.service);

 run(String id) async{
  service.SetSol(id);
}
}