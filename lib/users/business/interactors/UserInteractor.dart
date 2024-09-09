import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/users/business/interactors/AuthentificationUseCase.dart';
import 'package:seedbot/users/business/interactors/CreerCompteUseCase.dart';
import 'package:seedbot/users/business/interactors/DeconnexionUseCase.dart';
import 'package:seedbot/users/business/interactors/ForgetPassWordUseCase.dart';
import 'package:seedbot/users/business/service/userService.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/users/ui/pages/creerCompte/CreerComptePage.dart';

part 'UserInteractor.g.dart';

class UserInteractor{
  AuthentificationUseCase authentificationUseCase;
  DeconnexionUseCase deconnexionUseCase;
  ForgetPassWordUseCase forgetPassWordUseCase;
  CreerCompteUseCase creerCompteUseCase;

  UserInteractor._(
      this.authentificationUseCase,
      this.deconnexionUseCase,
      this.forgetPassWordUseCase,
      this.creerCompteUseCase
      );

  static buil(UserService service){
    return UserInteractor._(AuthentificationUseCase(service),DeconnexionUseCase(service),
      ForgetPassWordUseCase(service),CreerCompteUseCase(service)

    );
  }

}
@Riverpod(keepAlive: true)
UserInteractor userInteractor(Ref ref){
  throw Exception("pas encore implemente");

}