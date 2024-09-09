import 'package:seedbot/seedbot/business/service/SeedbotService.dart';

class SemerUseCase{
  SeedbotService service;
  SemerUseCase(this.service);

  Future<bool> run(bool value) async{
    return service.semer(value);
  }
}