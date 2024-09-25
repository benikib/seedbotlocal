import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedbot/Navigator/GoRouter.dart';
import 'package:seedbot/seedbot/ui/pages/navbar.dart';
import 'package:seedbot/users/ui/pages/authentification/authentificationPage.dart';
import 'package:seedbot/users/ui/pages/creerCompte/CreerCompteCtrl.dart';
import 'package:seedbot/utils/MyColor.dart';

import '../../../../components/Button.dart';
import '../../../../components/CustomAppBar.dart';
import '../../../../components/ImageAsset.dart';
import '../../../../components/TextInput.dart';
import '../../../../seedbot/ui/pages/connexion/listAppareilConnect/ListAppareilConnectPage.dart';

class CreerCompte extends ConsumerStatefulWidget {
  const CreerCompte({super.key});

  @override
  ConsumerState createState() => _CreerCompteState();
}

class _CreerCompteState extends ConsumerState<CreerCompte> {

  @override
  var login = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var PasswordConfirm = TextEditingController();

  bool pswdVisible = false;
  bool etat = false;


  Widget build(BuildContext context) {
    var state = ref
        .watch(creerCompteCtrlProvider)
        .isLoading;
    return Scaffold(

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _authentification(),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  if(state) CircularProgressIndicator(),
                  _logo(),
                  _titreText(),
                  SizedBox(height: 20),
                  SizedBox(height: 10),
                  _emailField(),
                  SizedBox(height: 10),
                  _passwordField(),
                  SizedBox(height: 10),
                  _confirmPasswordField(),
                  SizedBox(height: 10),
                  _checkBox(),
                  SizedBox(height: 20),
                  _validerBtn(context, ref),


                ],
              ),
            ),

          ),
        )
    );
  }

  Widget _logo(){
    return   Container(
      padding: const EdgeInsets.only(top:150),
      child: ImageAsset(file: "assets/images/logo_seedbot_2.png"),


    );
  }

  Widget _titreText() {
    return Text(
      "Creer un compte", style: GoogleFonts.montserrat(fontSize: 30,),);
  }



  Widget _emailField() {
    return TextInput(
      hintText: "Email",
      controller: email,
      prefixIcon: Icons.mail,


    );
  }

  Widget _passwordField() {
    print("pswdVisible : $pswdVisible");
    return TextInput(

      controller: password,
      hintText: "Mot de passe",
      obscureText: pswdVisible,
      prefixIcon: Icons.lock,
      suffixIcon: pswdVisible ? Icons.visibility_outlined : Icons
          .visibility_off,


    );
  }

  Widget _confirmPasswordField() {
    return TextInput(
      controller: PasswordConfirm,
      hintText: "Confirmer mot de passe",
      obscureText: pswdVisible,
      prefixIcon: Icons.lock,
      suffixIcon: pswdVisible ? Icons.visibility_outlined : Icons
          .visibility_off,
    );
  }

  Widget _checkBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(value: etat, onChanged: (value) {
          setState(() {

          });
          etat = !etat;
        }, activeColor: MyColor.c1,),
        Expanded(
          child: Text("J’ai lu et j’accepte les Termes et Conditions dont "
              "les  conditions générales d’utilisation et la Politique de Confidentialité",
            maxLines: 3, style: GoogleFonts.montserrat(fontSize:12),),
        )
      ],);
  }

  Widget _validerBtn(BuildContext context, WidgetRef ref) {
    return Button(text: "Creer Compte", onPressed: () async {
      var ctrl = ref.read(creerCompteCtrlProvider.notifier);
      Map<String, String> data = {

        "email": email.text,
        "password": password.text,
        "passwordConfirmation": PasswordConfirm.text
      };
      var res = await ctrl.creerCompte(data);
      if (true) {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => Navbar()));
      }
    }
    );
  }

  _authentification() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Vous avez un compte ? ", style: GoogleFonts.montserrat(),),
          TextButton(onPressed: () {
            context.goNamed(Urls.authentification.name);
          },
              child: Text("Se connecter",
                style: GoogleFonts.montserrat(color: MyColor.c1),))
        ]);
  }
}


