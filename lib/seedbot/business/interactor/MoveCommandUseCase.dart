import 'package:seedbot/seedbot/business/service/SeedbotService.dart';

class MoveCommandUseCase{
  SeedbotService service;
  MoveCommandUseCase(this.service);

  Future <bool> run(bool value) async{
    return service.moveCommand(value);
  }
}