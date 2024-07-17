import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/TestPage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:seedbot/user/seedbot/business/interactor/seedbotInteractor.dart';
import 'package:seedbot/user/seedbot/business/service/SeedbotService.dart';
import 'package:seedbot/user/seedbot/ui/framework/SeedbotServiceImplLocal.dart';





void main() {
  SeedbotService seedbotServiceImplLocal = SeedbotServiceImplLocal();
  SeedbotInteractor seedbotInteractor = SeedbotInteractor.build(seedbotServiceImplLocal);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(ProviderScope(
      overrides: [
        seedbotInteractorProvider.overrideWithValue(seedbotInteractor),
      ],
      child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:TestPage() ,
    );
  }
}