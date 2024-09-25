

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
    if(res == null) return false;
    var local = ref.watch(userInteractorProvider).saveTokenUseCase;
    await local.run(res);

    var   localUser = ref.watch(userInteractorProvider).saveUseCase
    ;
    await localUser.run(data);

    state = state.copyWith(isLoading: false, );
    return true;


   }


}