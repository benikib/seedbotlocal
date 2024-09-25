

import 'package:seedbot/users/business/service/usersServiceLocal.dart';

import '../models/connexionAppareilModel/AppareilModel.dart';
import '../service/SeedbotService.dart';


class RecupereAppareilUseCase{
  SeedbotService service;
  RecupereAppareilUseCase(this.service);

  Future<List<AppareilModel>> run() async{
    return await service.recupereAppareil();
  }


}
