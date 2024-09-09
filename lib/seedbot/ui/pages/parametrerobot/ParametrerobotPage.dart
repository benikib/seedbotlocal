import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:seedbot/components/Button.dart';
import 'package:seedbot/components/TextSimple.dart';
import 'package:seedbot/seedbot/ui/pages/connexion/listAppareilConnect/ListAppareilConnectPage.dart';

import '../../../../components/TextInput.dart';

class ParametreerobotPage extends ConsumerStatefulWidget {
  const ParametreerobotPage({super.key});

  @override
  ConsumerState createState() => _ParametreState();
}

class _ParametreState extends ConsumerState<ParametreerobotPage> {
  List<String> typesemir = ["General","mais","ris","harico",] ;
  TextEditingController _profondeurController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var currentsemir = typesemir[0];
    return Scaffold(
      appBar: AppBar(
        title: Text("Seedbot"),
      ),
      body: Container(child: Column(

        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20.0),
            

              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                    Button(text: 'Menuel', onPressed: (){},),

                      Button(text: 'Automatique', onPressed: (){},),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(

                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextSimple(text: "Semir", color: Colors.black, fontSize: 24,bold: true,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Row(
                                children: [
                                  Radio(value: typesemir[0], groupValue: currentsemir, onChanged: (value){setState(() {
                                    currentsemir = value.toString();
                                  });}),
                                  TextSimple(text: 'General', color: Colors.black)
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Radio(value: typesemir[1], groupValue: currentsemir, onChanged: (value){setState(() {
                                    currentsemir = value.toString();
                                  });}),
                                  TextSimple(text: 'General', color: Colors.black)
                                ],
                              ),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Row(
                                children: [
                                  Radio(value: typesemir[0], groupValue: currentsemir, onChanged: (value){setState(() {
                                    currentsemir = value.toString();
                                  });}),
                                  TextSimple(text: 'General', color: Colors.black)
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Radio(value: typesemir[1], groupValue: currentsemir, onChanged: (value){setState(() {
                                    currentsemir = value.toString();
                                  });}),
                                  TextSimple(text: 'General', color: Colors.black)
                                ],
                              ),
                            ),

                          ],
                        ),
                        TextSimple(text: "Profondeur du sol", color: Colors.black, fontSize: 24,bold: true),
                        TextField(
                          controller: _profondeurController,
                          
                        ),
                        SizedBox(height: 20,),
                        TextSimple(text: "Diamètre de sortie", color: Colors.black, fontSize: 24,bold: true),
                        TextField(
                          controller: _profondeurController,

                        ),
                        SizedBox(height: 20,),
                        TextSimple(text: "Dureté du sol", color: Colors.black, fontSize: 24,bold: true),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
         
          Container(
            
                  margin: EdgeInsets.all(20.0),
                    


            child: Column(
              children: [
                Button(text: " Valider ", onPressed: (){},),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){},
                  child: TextSimple(text: "Rétablir paramètres par défaut",color: Colors.black,fontSize: 20,),
                )
              ],
            ),
            
              ),






        ],
      ),),
    );
  }
}
