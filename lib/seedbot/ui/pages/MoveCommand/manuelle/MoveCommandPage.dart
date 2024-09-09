import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedbot/components/CustomAppBar.dart';
import 'package:seedbot/components/IconImage.dart';
import 'package:seedbot/components/ImageAsset.dart';
import 'package:seedbot/utils/MyColor.dart';

import '../../../../../ListTileApp.dart';
import '../../../../../components/TextSimple.dart';
import 'MoveCommandCtrl.dart';

class MoveCommandPage extends ConsumerStatefulWidget {
  const MoveCommandPage({super.key});

  @override
  ConsumerState createState() => _MoveCommandPageState();
}

class _MoveCommandPageState extends ConsumerState<MoveCommandPage> {
  double _x = 100;
  double _y = 100;
  bool etat = false;
  JoystickMode _joystickMode = JoystickMode.all;
  var ctrlstate;
  var _chargement = false;

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var ctrl = ref.read(moveCommandCtrlProvider.notifier);

    });
  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var ctrlstate = ref.watch(moveCommandCtrlProvider);

    return Scaffold(



      body: Stack(

        children: [
          _body(context),
          //_chargement

        ],
      )

    );
  }
  Widget _body(BuildContext context) {
    return buildBody();
  }
  Widget buildBody() {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [MyColor.c5, MyColor.c3],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(


        child: Column(
          children: [back_arrow(),title(),semer_and_labourer(), stop_urgence(),_joystick(),],
        ),
      ),
    );


  }
Widget title() {
  return Container(
    child: TextSimple(text: "Seedbot",color: MyColor.white,fontSize: 50,bold: true,)
  );
}
  Widget back_arrow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         IconImage(file: "assets/images/bouton_off.png",height: 30,width: 30,onTap: () {print("stop");},),

          IconImage(onTap: () {}, file: "assets/images/setting.png",height: 30,width: 30),
        ],
      ),
    );
  }
  Widget semer_and_labourer() {
   var  semer =ref.watch(moveCommandCtrlProvider).semer;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 5,),
          _shape(IconImage(onTap: () {print("semer");
            setState(() {
              semer = !semer;
              ref.read(moveCommandCtrlProvider.notifier).commandeSemer(value: semer);

            });},file: "assets/images/seed.png",color: semer?MyColor.c5:MyColor.white,)),


          _shape( IconImage(file: "assets/images/bouton_labourer2.png")),
          SizedBox(width: 5,),
        ],
      ),
    );
  }
  Widget stop_urgence() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(
            decoration: BoxDecoration(


      boxShadow: [

        BoxShadow(
        color: Colors.black45,
        spreadRadius: 2,
        blurRadius: 3,
        offset: Offset(0, 5),
      )
      ],

      border: Border.all(


        color: MyColor.c4,
        width: 3.0,

      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
              child: IconImage(file:"assets/images/loupe_verte.png" ,color: MyColor.c5,)),

          _shape( IconImage(file: "assets/images/bouton_decapotable.png",),),

        ],
      ),
    );
  }

 Widget _joystick() {
    return Container(

      child: SafeArea(
        child: Stack(
          children: [

            Align(
              alignment: const Alignment(0, 0.8),
              child: Joystick(
                mode: _joystickMode,
                listener: (details) {
                  setState(() {
                    if (details.x > 0) {
                      if (details.y > 0) {
                        print("Joystick moving forward right");
                      } else if (details.y < 0) {
                        print("Joystick moving backward right");
                      } else {
                        print("Joystick moving right");
                      }
                    } else if (details.x < 0) {
                      if (details.y > 0) {
                        print("Joystick moving forward left");
                      } else if (details.y < 0) {
                        print("Joystick moving backward left");
                      } else {
                        print("Joystick moving left");
                      }
                    } else {
                      if (details.y > 0) {
                        print("Joystick moving up");
                      } else if (details.y < 0) {
                        print("Joystick moving down");
                      }
                    }

                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
}
  Widget info_plus() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),

        ],
      ),
    );
  }
 Widget _shape(Widget imageicon) {



  return  Container(
    decoration: BoxDecoration(


      boxShadow: [

        BoxShadow(
          color: Colors.black45,
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 5),
        )
      ],

      border: Border.all(


        color: MyColor.c4,
        width: 3.0,

      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
        child: imageicon,
      );
  }
}

class Ball {
}
