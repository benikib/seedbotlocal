


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seedbot/users/ui/screen/ScreenPage.dart';

import '../users/ui/pages/authentification/authentificationPage.dart';
import '../users/ui/pages/pageIntros/IntroPage.dart';
import 'Route.dart';


final goRouterProvider = Provider<GoRouter>((ref) {
  // final authState = ref.watch(userAuthProvider); // État d'authentification

  return GoRouter(
    initialLocation: '/AuthentificationPage',
    /*  redirect: (context, state) {
      if (authState.isLogedIn) {
        return '/otp-verify'; // Redirige vers la vérification OTP si connecté
      } else {
        return '/authlanding'; // Sinon, vers la page d'accueil
      }
    },*/
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            const MaterialPage(child: AuthentificationPage()),
      ),
      GoRoute(
        path: '/AuthentificationPage',
        name: authentification,
        pageBuilder: (context, state) =>
            const MaterialPage(child: AuthentificationPage()),
      ),
      GoRoute(
        path: '/SplashPage',
        name: intro,
        pageBuilder: (context, state) =>
            const MaterialPage(child: IntroPage()),
      ),
      GoRoute(
        path: '/SplashPage2',
        name: OnBoarding,
        pageBuilder: (context, state) =>
            const MaterialPage(child: OnBoardingPage()),
      ),

    ],
  );
});
