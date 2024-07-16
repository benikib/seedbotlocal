import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/TestPage.dart';





void main() {

  runApp(ProviderScope(
      overrides: [

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