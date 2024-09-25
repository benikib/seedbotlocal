import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:seedbot/components/Button.dart';
import 'package:seedbot/components/TextSimple.dart';

import 'package:seedbot/seedbot/ui/pages/connexion/listAppareilConnect/ListAppareilConnectPage.dart';
import 'package:seedbot/utils/MyColor.dart';

import '../../../../components/TextInput.dart';
import 'ParametreCtrl.dart';

class ParametreerobotPage extends ConsumerStatefulWidget {
  const ParametreerobotPage({super.key});

  @override
  ConsumerState createState() => _ParametreState();
}

class _ParametreState extends ConsumerState<ParametreerobotPage> {
  List<String> typesemir = ["Maïs","General","Harico",] ;
  TextEditingController _distanceController = TextEditingController();
  TextEditingController _diametreController = TextEditingController();

  var  currentsemir ;
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var ctrl = ref.read(parametreCtrlProvider.notifier);



    });

  }

  @override
  Widget build(BuildContext context) {
    String? currentsemir = typesemir[0];
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Hauteur standard de l'AppBar
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  MyColor.c1,
                  MyColor.c1,
                ],
              ),
            ),
          ),
          title: Text("Seedbot"),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            MyColor.c1,
              Colors.deepOrangeAccent,
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height, // Prendre toute la hauteur de l'écran
        child: SingleChildScrollView(
          child: Column(
            children: [
              _title(),
              Center(
                child: Container(
                  padding:EdgeInsets.all(20.0),

                  margin: EdgeInsets.all(20.0),


                  decoration: BoxDecoration(
                    color: MyColor.white,
                    borderRadius: BorderRadius.circular(30.0),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [


                      Container(

                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            TextSimple(text: "Distance ", color: Colors.black, fontSize: 24,bold: true),
                            TextField(
                              controller: _distanceController,

                            ),
                            SizedBox(height: 20,),
                            TextSimple(text: "Diamètre de sortie", color: Colors.black, fontSize: 24,bold: true),
                            TextField(
                              controller: _diametreController,

                            ),
                            SizedBox(height: 20,),


                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
             //_config(currentsemir),
              _validerBtn(),
            ],
          ),
        ),
      ),

    );
  }
  _validerBtn() {
    return  Container(

      margin: EdgeInsets.all(20.0),



      child: Center(
        child: Column(
          children: [
            Button(text: " Valider ", onPressed: (){
            var Ctrl = ref.read(parametreCtrlProvider.notifier);
                Ctrl.configuration({
                  "semir": currentsemir,
                  "distance/seed": _distanceController.text,
                  "diametres": _diametreController.text,
                });
            Navigator.pop(context);
            },),
            SizedBox(height: 20,),
            TextSimple(text: "Rétablir les valeurs par défaut ", color: Colors.black)
          ],
        ),
      ),

    );
  }
  _title() {
    return Container(
      margin: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextSimple(text: "Configuration" , color: Colors.black, fontSize: 24,bold: true,),
            Image(image: AssetImage("assets/images/config_2.png"),height: 50,width: 50,),
          ],
        ));
  }
  Widget _config(currentsemir) {
    return Center(
      child: Container(
        padding:EdgeInsets.all(20.0),

        margin: EdgeInsets.all(20.0),


        decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(30.0),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            Container(

              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextSimple(text: "Semir", color: Colors.black, fontSize: 24,bold: true,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Premier bouton radio
                      Row(

                        children: [

                          Radio(
                            value: typesemir[0],
                            groupValue: currentsemir,
                            onChanged: (value) {
                              setState(() {
                                currentsemir = value;
                                print('type de semir currentsemir  $currentsemir');
                                print('type de semir value  ${value.toString()}');
                              });
                            },
                          ),
                          TextSimple(text: typesemir[0].toString(), color: Colors.black),
                        ],
                      ),
                      // Deuxième bouton radio
                      Row(
                        children: [
                          Radio(
                            value: typesemir[1],
                            groupValue: currentsemir,
                            onChanged: (value) {
                              setState(() {
                                currentsemir = value;
                                print('type de semir currentsemir  $currentsemir');
                                print('type de semir value  ${value.toString()}');
                              });
                            },
                          ),
                          TextSimple(text: typesemir[1].toString(), color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Troisième bouton radio
                      Row(
                        children: [
                          Radio(
                            value: typesemir[2],
                            groupValue: currentsemir,
                            onChanged: (value) {
                              setState(() {
                                currentsemir = value;
                                print('type de semir currentsemir  $currentsemir');
                                print('type de semir value  ${value.toString()}');
                              });
                            },
                          ),
                          TextSimple(text: typesemir[2].toString(), color: Colors.black),
                        ],
                      ),
                      // Quatrième bouton radio
                      Row(
                        children: [
                          Radio(
                            value: typesemir[3],
                            groupValue: currentsemir,
                            onChanged: (value) {
                              setState(() {
                                currentsemir = value;
                                print('type de semir currentsemir  $currentsemir');
                                print('type de semir value  ${value.toString()}');
                              });
                            },
                          ),
                          TextSimple(text: typesemir[3].toString(), color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                  TextSimple(text: "Profondeur du sol", color: Colors.black, fontSize: 24,bold: true),
                  TextField(
                    controller: _distanceController,

                  ),
                  SizedBox(height: 20,),
                  TextSimple(text: "Diamètre de sortie", color: Colors.black, fontSize: 24,bold: true),
                  TextField(
                    controller: _diametreController,

                  ),
                  SizedBox(height: 20,),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
