import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/components/Button.dart';
import 'package:seedbot/users/ui/pages/creerCompte/CreerComptePage.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class IntroPage extends ConsumerStatefulWidget {
  const IntroPage({super.key});

  @override
  ConsumerState createState() => _IntroPageState();
}

class _IntroPageState extends ConsumerState<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Button(text: "Inscription",
          onPressed: (){ Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => CreerCompte()));}),

      body:  Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/champ_seedbdot.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(

              child: Column(

                children: [
                  Image.asset("assets/images/ciel_seedbot.png"),
                  Image.asset("assets/images/voiture_seedbot.png"),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
