import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/components/Button.dart';
import 'package:seedbot/components/TextSimple.dart';

import '../../../../components/BottomNavigationBarApp.dart';
import '../../../../components/CustomAppBar.dart';
import '../../../../utils/MyColor.dart';

class ProfilPage extends ConsumerStatefulWidget {
  const ProfilPage({super.key});

  @override
  ConsumerState createState() => _ProfilPageState();
}

class _ProfilPageState extends ConsumerState<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: CustomAppBar(
        title: "Seedbot",
      ),
      body: SingleChildScrollView(
        child: Column(
            children:[
              Container(
                child: Icon(Icons.person,size: 150, color: MyColor.white,),
                width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                color : MyColor.c1,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(270), bottomRight: Radius.circular(270)),
              ),
            ),
              SizedBox(height: 30),
              _infopersonnel(icon :Icons.person, info: "Nom complet"),
              _infopersonnel(icon :Icons.phone, info: "+243 999 999 999"),
              _infopersonnel(icon :Icons.mail, info: "seedbot@gmail.com"),
              _infopersonnel(icon :Icons.scoreboard_sharp, info: "1"),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Button(text: "Deconnexion", onPressed: (){}),
              )
          ],
          ),
      ),


    );
  }
  _infopersonnel({ required IconData icon,  required String info}) {

    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
            child: Row(children: [
              Icon(icon),
              SizedBox(width: 20),
              TextSimple(text: info, color: Colors.black, fontSize: 20),

            ]),
          ),
          Divider(color: MyColor.c1,
            thickness: 2,
          ),

        ]          );
  }
}
