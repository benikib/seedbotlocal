import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/seedbot/business/interactor/RecupereAppareilUseCase.dart';
import 'package:seedbot/users/business/interactors/AuthentificationUseCase.dart';
import 'package:seedbot/users/business/interactors/CategoriesUseCase.dart';
import 'package:seedbot/users/business/interactors/CreerCompteUseCase.dart';
import 'package:seedbot/users/business/interactors/DeconnexionUseCase.dart';
import 'package:seedbot/users/business/interactors/ForgetPassWordUseCase.dart';
import 'package:seedbot/users/business/interactors/RecupureTokenUseCase.dart';
import 'package:seedbot/users/business/interactors/SaveTokenUseCase.dart';
import 'package:seedbot/users/business/interactors/SaveUseCase.dart';
import 'package:seedbot/users/business/service/userService.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/users/ui/pages/creerCompte/CreerComptePage.dart';

import '../service/usersServiceLocal.dart';
import 'NotificationUseCase.dart';

part 'UserInteractor.g.dart';

class UserInteractor{
  AuthentificationUseCase authentificationUseCase;
  DeconnexionUseCase deconnexionUseCase;
  ForgetPassWordUseCase forgetPassWordUseCase;
  CreerCompteUseCase creerCompteUseCase;
  CategoriesUseCase categoriesUseCase;
  SaveTokenUseCase saveTokenUseCase;
  RecuperTokenUseCase recuperTokenUseCase;
  NotificationUseCase notificationUseCase;
  SaveUseCase saveUseCase;

  UserInteractor._(
      this.authentificationUseCase,
      this.deconnexionUseCase,
      this.forgetPassWordUseCase,
      this.creerCompteUseCase,
      this.categoriesUseCase,
      this.saveTokenUseCase,
      this.recuperTokenUseCase,
      this.notificationUseCase,
      this.saveUseCase

      );

  static buil(UserService service, UsersServiceLocal usersServiceLocal) {
    return UserInteractor._(AuthentificationUseCase(service),DeconnexionUseCase(service),
            ForgetPassWordUseCase(service),CreerCompteUseCase(service),
              CategoriesUseCase(service), SaveTokenUseCase(usersServiceLocal),
              RecuperTokenUseCase(usersServiceLocal),NotificationUseCase(service),
              SaveUseCase(usersServiceLocal),

    );
  }

}
@Riverpod(keepAlive: true)
UserInteractor userInteractor(Ref ref){
  throw Exception("pas encore implemente");

}