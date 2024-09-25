import 'package:seedbot/seedbot/ui/framework/ServiceConnectMqtt.dart';

import '../service/ServiceConnectCmd.dart';

class SetSolUseCase{
ServiceConnectCmd service;
SetSolUseCase(this.service);

 run(String id) async{
  service.SetSol(id);
}
}