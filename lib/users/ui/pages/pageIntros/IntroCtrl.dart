import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/users/business/interactors/UserInteractor.dart';

import 'IntroState.dart';

part 'IntroCtrl.g.dart';

@riverpod
class IntroCtrl extends _$IntroCtrl {

  @override
  IntroState build() {
    return IntroState();
  }
  categories() async{

    state = state.copyWith(isLoading: true);
    var  usecase  = ref.watch(userInteractorProvider).categoriesUseCase;
    var res =  await  usecase.run();
    print("ctrl categories :$res");
    state = state.copyWith(isLoading: false,data:"res" );

  }
}
