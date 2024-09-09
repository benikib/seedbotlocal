import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/seedbot/ui/framework/ServiceConnectMqtt.dart';

import '../service/SeedbotService.dart';
import '../service/ServiceConnectCmd.dart';
import 'ConnectIdUseCase.dart';
import 'MoveCommandUseCase.dart';
import 'LabourerUseCase.dart';
import 'RecupereAppareilUseCase.dart';
import 'SemerUseCase.dart';



part 'seedbotInteractor.g.dart';

class SeedbotInteractor{
  RecupereAppareilUseCase recupereAppareilUseCase;
  SemerUseCase semerUseCase;
  LabourerUseCase labourerUseCase;
  MoveCommandUseCase moveCommandUseCase;
  ConnectIdUseCase connectIdUSeCase;
  SeedbotInteractor._(
      this.recupereAppareilUseCase,
      this.semerUseCase,
      this.labourerUseCase,
      this.moveCommandUseCase,
      this.connectIdUSeCase
      );

  static SeedbotInteractor build(SeedbotService service,ServiceConnectCmd  serviceCmd){
    return SeedbotInteractor._(RecupereAppareilUseCase(service),SemerUseCase(service),
                                LabourerUseCase(service), MoveCommandUseCase(service),
                                ConnectIdUseCase(serviceCmd),);
  }
}
@Riverpod(keepAlive: true)
SeedbotInteractor seedbotInteractor(Ref ref){
  throw Exception("pas encore ");
}