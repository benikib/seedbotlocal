


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/seedbot/ui/pages/home/HomePage.dart';
import 'package:seedbot/seedbot/ui/pages/navbar.dart';
import 'package:seedbot/users/business/interactors/UserInteractor.dart';
import 'package:seedbot/users/ui/pages/creerCompte/CreerComptePage.dart';
import 'package:seedbot/users/ui/pages/pageIntros/Intro.dart';
import 'package:seedbot/users/ui/screen/ScreenPage.dart';

import '../users/ui/pages/authentification/authentificationPage.dart';
import '../users/ui/pages/pageIntros/IntroPage.dart';
import 'Route.dart';
 enum Urls {  authentification, creercompte, OnBoarding, pageIntros,Navbar,intro }

final goRouterProvider = Provider<GoRouter>((ref) {
  // final authState = ref.watch(userAuthProvider);
  // État d'authentification
    final userInteractor = ref.watch(userInteractorProvider);

  return GoRouter(
    initialLocation: '/intro',
    redirect: (context, state)  async{
       var user =   await userInteractor.recuperTokenUseCase.run();
       print('goroute user ${  user.toString()}');
      if (user == null) {

        return '/navbar'; // Redirige vers la vérification OTP si connecté
      } else {

        return '/navbar'; // Sinon, vers la page d'accueil
      }
      },
    routes: [
      GoRoute(
        name: Urls.intro.name,
        path: '/intro',
        builder: (context, state) => const Intro(),
      ),
      GoRoute(
        name: Urls.authentification.name,
        path: '/AuthenticationPage',
        builder: (context, state) => const AuthentificationPage(),
      ),
      GoRoute(
        name: Urls.creercompte.name,
        path: '/creerCompte',
        builder: (context, state) => const CreerCompte(),
      ),
      GoRoute(
        name: Urls.Navbar.name,
        path: '/navbar',
        builder: (context, state) => const Navbar(),
      ),

    ],
    /*  redirect: (context, state) {
      if (authState.isLogedIn) {
        return '/otp-verify'; // Redirige vers la vérification OTP si connecté
      } else {
        return '/authlanding'; // Sinon, vers la page d'accueil
      }
    },*/


  );
});


