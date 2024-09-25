import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/seedbot/business/interactor/BatterieUseCase.dart';
import 'package:seedbot/seedbot/business/interactor/ConfigurationUseCase.dart';
import 'package:seedbot/seedbot/business/interactor/DeconnexionUseCase.dart';
import 'package:seedbot/seedbot/business/interactor/DeplacementUseCase.dart';
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
  DeplacementUseCase deplacementUseCase;
  ConfigurationUseCase configurationUseCase;

  SeedbotInteractor._(
      this.recupereAppareilUseCase,
      this.semerUseCase,
      this.labourerUseCase,
      this.moveCommandUseCase,
      this.connectIdUSeCase,
      this.deconnexionUseCase,
      this.batterieUseCase,
      this.setSolUseCase,
      this.deplacementUseCase,
      this.configurationUseCase
      );

  static SeedbotInteractor build(SeedbotService service,ServiceConnectCmd  serviceCmd){
    return SeedbotInteractor._(RecupereAppareilUseCase(service),SemerUseCase(service),
                                LabourerUseCase(service), MoveCommandUseCase(service),
                                ConnectIdUseCase(serviceCmd), DeconnexionUseCase(serviceCmd),
                                BatterieUseCase(serviceCmd), SetSolUseCase(serviceCmd),
                                DeplacementUseCase(serviceCmd),ConfigurationUseCase(serviceCmd)
                                  );
  }
}
@Riverpod(keepAlive: true)
SeedbotInteractor seedbotInteractor(Ref ref){
  throw Exception("pas encore ");
}