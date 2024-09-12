

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/users/business/interactors/UserInteractor.dart';

import 'authentificationState.dart';

part 'AuthentificationCtrl.g.dart';

@riverpod
class AuthentificationCtrl extends _$AuthentificationCtrl {

  @override
  AuthentificationState build(){
    return AuthentificationState();

  }

   Future<bool>  connexion(data) async{
    state = state.copyWith(isLoading: true);
    var  usecase  = ref.watch(userInteractorProvider).authentificationUseCase;
    var res =  await  usecase.run(data);
    print("res :$res");
    state = state.copyWith(isLoading: false, );
    return true;


   }


}