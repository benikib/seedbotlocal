import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/users/business/interactors/UserInteractor.dart';

import 'CreerCompteState.dart';
part 'CreerCompteCtrl.g.dart';

@riverpod
class CreerCompteCtrl extends _$CreerCompteCtrl {

  @override
  CreerCompteState build() {
    return CreerCompteState();
  }
 creerCompte(data) async{

    state = state.copyWith(isLoading: true);
    var  usecase  = ref.watch(userInteractorProvider).creerCompteUseCase;
    var res =  await  usecase.run(data);
    state = state.copyWith(isLoading: false,data:"res" );
    return true;

 }

}

