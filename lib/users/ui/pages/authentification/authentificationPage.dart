import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:seedbot/components/Button.dart';
import 'package:seedbot/components/CustomAppBar.dart';
import 'package:seedbot/seedbot/ui/pages/navbar.dart';
import 'package:seedbot/users/ui/pages/authentification/AuthentificationCtrl.dart';
import 'package:seedbot/users/ui/pages/creerCompte/CreerComptePage.dart';
import 'package:seedbot/utils/MyColor.dart';

import '../../../../components/BottomNavigationBarApp.dart';
import '../../../../components/ImageAsset.dart';
import '../../../../components/TextInput.dart';
import '../../../../components/TextSimple.dart';
import '../../../../seedbot/ui/pages/connexion/listAppareilConnect/ListAppareilConnectPage.dart';
import '../../../../seedbot/ui/pages/home/HomePage.dart';

class AuthentificationPage extends ConsumerStatefulWidget {
  const AuthentificationPage({super.key});


  @override
  ConsumerState createState() => _AuthetificationPageState();
}

class _AuthetificationPageState extends ConsumerState<AuthentificationPage> with TickerProviderStateMixin {
  var login=TextEditingController();
  var password=TextEditingController();
  bool pswdVisible = false;
  late final AnimationController _controller;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }



  @override
  Widget build(BuildContext context) {
    var state = ref.watch(authentificationCtrlProvider).isLoading;

    return Scaffold(

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: _creerCompte(),
      ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [

                    if(state) CircularProgressIndicator(),
                    _logo(),
                    _titreText(),
                    SizedBox(height: 30),
                    _usernameField(),
                    SizedBox(height: 30),
                    _passwordField(),
                    SizedBox(height: 30),
                    _validerBtn(context, ref),
                    SizedBox(height: 20,),


                    TextSimple(text: "Mot de passe oublie ?",onTap: (){print("object");}, color: MyColor.c4),

                  ],
                )
            ),
          ),
        )
    );
  }
  Widget _titreText(){
    return Text("Connexion",
      style: GoogleFonts.montserrat(fontSize: 30),);
  }
  Widget _logo(){
    return   Container(
      padding: const EdgeInsets.only(top:150),
      child: ImageAsset(file: "assets/images/logo_seedbot_2.png"),


    );
  }


  Widget _usernameField(){

    return TextInput(
      hintText: "Email",
      controller: login,

      prefixIcon:Icons.person,



    );
  }

  Widget _passwordField(){
    print("pswdVisible : $pswdVisible");
    return TextInput(

        controller: password,
        hintText: "Mot de passe",
        obscureText :pswdVisible,
        prefixIcon: Icons.lock,
        suffixIcon: pswdVisible ? Icons.visibility_outlined :Icons.visibility_off,



    );
  }
  Widget _validerBtn(BuildContext context, WidgetRef ref) {
    return Button(text: "Connexion", onPressed: () async {

      var ctrl = ref.read(authentificationCtrlProvider.notifier);
      Map<String, String> data = {
        "email": login.text,
        "password": password.text
      };
      var res = await ctrl.connexion(data);
      if (res) {
        print(res);
        Navigator.push(context, MaterialPageRoute(builder:(ctx)=> Navbar() ));
      }
    }
    );
  }
  _creerCompte(){
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text("Pas encore de compte ?"),
        SizedBox(width: 10),
        TextSimple(text: "S'enregistrer ?",onTap: (){Navigator.push(context, MaterialPageRoute(builder:(ctx)=> CreerCompte() ));}, color: MyColor.c4),
      ],
    );
  }
}
