import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/seedbot/business/interactor/BatterieUseCase.dart';
import 'package:seedbot/seedbot/business/interactor/DeconnexionUseCase.dart';
import 'package:seedbot/seedbot/ui/framework/ServiceConnectMqtt.dart';

import '../service/SeedbotService.dart';
import '../service/ServiceConnectCmd.dart';
import 'ConnectIdUseCase.dart';
import 'MoveCommandUseCase.dart';
import 'LabourerUseCase.dart';
import 'RecupereAppareilUseCase.dart';
import 'SemerUseCase.dart';
import 'SetSolUseCase.dart';



part 'seedbotInteractor.g.dart';

class SeedbotInteractor{
  RecupereAppareilUseCase recupereAppareilUseCase;
  SemerUseCase semerUseCase;
  LabourerUseCase labourerUseCase;
  MoveCommandUseCase moveCommandUseCase;
  ConnectIdUseCase connectIdUSeCase;
  DeconnexionUseCase deconnexionUseCase;
  BatterieUseCase batterieUseCase;
  SetSolUseCase setSolUseCase;

  SeedbotInteractor._(
      this.recupereAppareilUseCase,
      this.semerUseCase,
      this.labourerUseCase,
      this.moveCommandUseCase,
      this.connectIdUSeCase,
      this.deconnexionUseCase,
      this.batterieUseCase,
      this.setSolUseCase
      );

  static SeedbotInteractor build(SeedbotService service,ServiceConnectCmd  serviceCmd){
    return SeedbotInteractor._(RecupereAppareilUseCase(service),SemerUseCase(service),
                                LabourerUseCase(service), MoveCommandUseCase(service),
                                ConnectIdUseCase(serviceCmd), DeconnexionUseCase(serviceCmd),
                                BatterieUseCase(serviceCmd), SetSolUseCase(serviceCmd)
                                  );
  }
}
@Riverpod(keepAlive: true)
SeedbotInteractor seedbotInteractor(Ref ref){
  throw Exception("pas encore ");
}