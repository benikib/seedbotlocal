import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/user/seedbot/business/service/SeedbotService.dart';

class RecupereAppareilUseCase{
  SeedbotService service;
  RecupereAppareilUseCase(this.service);

  Future<dynamic> run() async{
    return await service.recupereAppareil();
  }


}
