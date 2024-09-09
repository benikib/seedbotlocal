import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../business/interactor/seedbotInteractor.dart';
import 'HomeState.dart';

part 'HomeCtrl.g.dart';
@riverpod
class HomeCtrl extends _$HomeCtrl {
  @override
  HomeState build() {
    return HomeState();
  }

   void commandeSemer({required bool value}) async{
    bool val = value;
    state = state.copyWith(isLoading: true);
    var usecase = ref.watch(seedbotInteractorProvider).semerUseCase;

    var res = await usecase.run(val);

    state = state.copyWith(isLoading: false, data: res);

  }



}