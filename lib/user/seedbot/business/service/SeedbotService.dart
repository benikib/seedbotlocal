import 'package:seedbot/user/seedbot/business/models/connexionAppareilModel/EtablirConnexionModel.dart';

abstract class SeedbotService{
  Future<List<dynamic>>recupereAppareil();
  Future<dynamic> etablirConnexionService(EtablirConnexionModel);

}