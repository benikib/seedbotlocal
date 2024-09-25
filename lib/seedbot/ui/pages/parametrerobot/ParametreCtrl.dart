import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../../../business/interactor/seedbotInteractor.dart';
import 'ParametreState.dart';


part 'ParametreCtrl.g.dart';

@riverpod
class ParametreCtrl extends _$ParametreCtrl {
  @override
  ParametreState build() {
    return ParametreState();
  }

  configuration(Map<String, dynamic> data) async{


    state = state.copyWith(isLoading: true);
    var usecase = ref.watch(seedbotInteractorProvider).configurationUseCase;

    var res = await usecase.run(data);



  }





}