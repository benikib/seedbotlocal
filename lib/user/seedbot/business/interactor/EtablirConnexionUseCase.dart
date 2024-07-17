import 'package:seedbot/user/seedbot/business/models/connexionAppareilModel/EtablirConnexionModel.dart';
import 'package:seedbot/user/seedbot/business/service/SeedbotService.dart';

class EtablirConnexionUseCase{
  SeedbotService service;
  EtablirConnexionUseCase(this.service);

  Future<dynamic> run(EtablirConnexionModel data) async{
    return service.etablirConnexionService(data);
}
}