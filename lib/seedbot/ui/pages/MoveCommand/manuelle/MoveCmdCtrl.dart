import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    var value = await usecase.deconnexion(id);
    print("ListAppareillConnectID $value");}


}