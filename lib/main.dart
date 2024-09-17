import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:seedbot/Navigator/GoRouter.dart';
import 'package:seedbot/seedbot/business/interactor/seedbotInteractor.dart';
import 'package:seedbot/seedbot/business/service/SeedbotService.dart';
import 'package:seedbot/seedbot/business/service/ServiceConnectCmd.dart';
import 'package:seedbot/seedbot/ui/framework/SeedbotServiceImplLocal.dart';
import 'package:seedbot/seedbot/ui/framework/ServiceConnectMqtt.dart';
import 'package:seedbot/seedbot/ui/framework/ServiceConnectMqtt.dart';
import 'package:seedbot/seedbot/ui/pages/MoveCommand/manuelle/MoveCommandPage.dart';

import 'package:seedbot/seedbot/ui/pages/connexion/listAppareilConnect/ListAppareilConnectPage.dart';
import 'package:seedbot/seedbot/ui/pages/home/HomePage.dart';
import 'package:seedbot/seedbot/ui/pages/navbar.dart';
import 'package:seedbot/seedbot/ui/pages/wifi/ScanWifi.dart';


import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';

import 'package:seedbot/users/business/interactors/UserInteractor.dart';
import 'package:seedbot/users/business/service/userService.dart';
import 'package:seedbot/users/ui/framework/userServiceImpleFake.dart';
import 'package:seedbot/users/ui/pages/authentification/authentificationPage.dart';
import 'package:seedbot/users/ui/pages/pageIntros/IntroPage.dart';
import 'package:seedbot/users/ui/pages/profil/ProfilPage.dart';

import 'AnalyseSol.dart';

import 'ListTileApp.dart';






void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
// make sure it exists
  await dir.create(recursive: true);
// build the database path
  final dbPath = join(dir.path, 'sembast.db');
// open the database
  final db = await databaseFactoryIo.openDatabase(dbPath);

  SeedbotService seedbotServiceImplLocal = SeedbotServiceImplLocal();
  ServiceConnectCmd  serviceConnectMqtt = ServiceConnectMqtt();
  SeedbotInteractor seedbotInteractor = SeedbotInteractor.build(seedbotServiceImplLocal,serviceConnectMqtt);


  UserService userService = UserServiceImpleFake();
  UserInteractor userInteractor = UserInteractor.buil(userService);

  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(ProviderScope(
      overrides: [
        seedbotInteractorProvider.overrideWithValue(seedbotInteractor),
        userInteractorProvider.overrideWithValue(userInteractor),
      ],
      child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      home: AuthentificationPage(),
    );
  }
}