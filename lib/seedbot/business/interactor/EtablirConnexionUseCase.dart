
import '../models/connexionAppareilModel/EtablirConnexionModel.dart';
import '../service/SeedbotService.dart';

class EtablirConnexionUseCase{
  SeedbotService service;
  EtablirConnexionUseCase(this.service);

  Future<dynamic> run(EtablirConnexionModel data) async{
    return service.etablirConnexionService(data);
}
}