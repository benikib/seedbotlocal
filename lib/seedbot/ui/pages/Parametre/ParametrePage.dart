import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/components/IconImage.dart';
import 'package:seedbot/components/TextSimple.dart';
import 'package:seedbot/users/ui/pages/profil/ProfilPage.dart';

import '../../../../components/BottomNavigationBarApp.dart';
import '../../../../components/Button.dart';
import '../../../../components/CustomAppBar.dart';
import '../../../../utils/MyColor.dart';

class ParametrePage extends ConsumerStatefulWidget {
  const ParametrePage({super.key});

  @override
  ConsumerState createState() => _ParametrePageState();
}

class _ParametrePageState extends ConsumerState<ParametrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: CustomAppBar(
        title: "Seedbot",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          _affichetitre(),


          SizedBox(height: 20),
          _menu(),


        ],
      ),
    );
  }

  _affichetitre() {
    return
      Padding(
        padding: const EdgeInsets.only(left: 110, top: 40),
        child: Row(
          children: [
            ImageIcon(AssetImage('assets/images/icon_parametres.png'), size: 40,
                color: MyColor.c4),
            SizedBox(width: 20),
            Text("Paramètres",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ],

        ),
      );
  }

  _menu() {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
          
            children: [modifier_profil(), _affichage_son(),_autre()],
          ),
        ),
      ),
    );
  }

  modifier_profil() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextSimple(
            text: "Profil", color: Colors.black45,),),


        bar_parametre(text: "Modier le profil",
            image: "assets/images/profil.png"),

      ],
    );
  }

  _affichage_son() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextSimple(text: "Affichage et Son", color: Colors.black45,),),


        bar_parametre(text: "Change le mode d'affichage",
            image: "assets/images/theme.png"),

        bar_parametre(
            text: "Taille de police ", image: "assets/images/police.png"),
        bar_parametre(text: "Langague", image: "assets/images/langues.png")

      ],
    );
  }
  _autre() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextSimple(text: "Autre", color: Colors.black45,),),

        bar_parametre(text: "Mettre a jour", image: "assets/images/mise_ jour.png"),
        bar_parametre(text: "Conditions d'utilisation",
            image: "assets/images/conditions_utilisation.png"),

        bar_parametre(
            text: "Assistance Technique ", image: "assets/images/assisatnce_clientèle.png"),
        bar_parametre(text: "Politique de confidentialité", image: "assets/images/politique_confidentialité.png"),
        bar_parametre(text: "A propos", image: "assets/images/apropos.png")

      ],
    );}

  bar_parametre({required String text, required String image }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => ProfilPage()));
      },
      child: Container(
      
      
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black12,
      
      
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              IconImage(file: image, height: 20, width: 20,),
              SizedBox(width: 20),
              TextSimple(text: text, color: Colors.black,),
            ],
          ),),
      ),
    );
  }


}
