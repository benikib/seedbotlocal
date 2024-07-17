import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/user/seedbot/business/interactor/RecupereAppareilUseCase.dart';
import 'package:seedbot/user/seedbot/business/service/SeedbotService.dart';
import 'package:seedbot/user/seedbot/ui/pages/connexion/listAppareilConnect/ListAppareilConnectCtrl.dart';

part 'seedbotInteractor.g.dart';

class SeedbotInteractor{
  RecupereAppareilUseCase recupereAppareilUseCase;
  SeedbotInteractor._(
      this.recupereAppareilUseCase
      );

  static SeedbotInteractor build(SeedbotService service){
    return SeedbotInteractor._(RecupereAppareilUseCase(service));
  }
}
@Riverpod(keepAlive: true)
SeedbotInteractor seedbotInteractor(Ref ref){
  throw Exception("pas encore ");
}