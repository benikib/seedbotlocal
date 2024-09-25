import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../business/interactor/SetSolUseCase.dart';
import '../../../../business/interactor/SetSolUseCase.dart';
import '../../../../business/interactor/seedbotInteractor.dart';
import 'MoveCommandState.dart';

part 'MoveCmdCtrl.g.dart';

@riverpod
class MoveCommandCtrl extends _$MoveCommandCtrl {
  @override
  MoveCommandState build() {
    return MoveCommandState();
  }
  moveCommand(bool value) async{
    bool val = value;
    state = state.copyWith(isLoading: true);
    var usecase = ref.watch(seedbotInteractorProvider).moveCommandUseCase;

    var res = await usecase.run(val);

    state = state.copyWith(isLoading: false, data: res);

  }
  void commandeSemer({required bool value}) async{
    bool val = value;
    print("semer movecammand: $val");
    state = state.copyWith(isLoading: true);
    var usecase = ref.watch(seedbotInteractorProvider).semerUseCase;

    var res = await usecase.run(val);

    state = state.copyWith(isLoading: false, semer: res);

  }
  void connectId(String id) async{
    var usecase   = ref.watch(seedbotInteractorProvider).connectIdUSeCase;
    var value = await usecase.run(id);
    print("ListAppareillConnectID $value");}




void deconnexion(String id) async{
  var usecase   = ref.watch(seedbotInteractorProvider).deconnexionUseCase;
  var value = await usecase.run(id);
  print("deconnexion ctrl $value");}


  void batterie(String id) async{
    state = state.copyWith(isLoading: true);
    var usecase   = ref.watch(seedbotInteractorProvider).batterieUseCase;
    var value = await usecase.run(id);
    final regex = RegExp(r'\d+');
    final match = regex.firstMatch(value);
    final numberString = match?.group(0);
    state = state.copyWith(isLoading: false, batterie: numberString);
    print("deconnexion ctrl $value");}



 SetSol(String id) async{
  state = state.copyWith(isLoading: true);
  var usecase   = ref.watch(seedbotInteractorProvider).setSolUseCase;
 await usecase.run(id);
return 'ok';
  }

 Future<String> deplacement(String id) async{
    state = state.copyWith(isLoading: true);
    var usecase   = ref.watch(seedbotInteractorProvider).deplacementUseCase;
    await usecase.run(id);
    return id;
  }

}

