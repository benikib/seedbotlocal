

import '../models/connexionAppareilModel/AppareilModel.dart';

abstract class SeedbotService{
  Future<List<AppareilModel>>recupereAppareil();
  Future<dynamic> etablirConnexionService(EtablirConnexionModel);
  Future<bool> labourer(bool res);
  Future<bool> semer(bool res);
  Future<bool> moveCommand(bool res);


}