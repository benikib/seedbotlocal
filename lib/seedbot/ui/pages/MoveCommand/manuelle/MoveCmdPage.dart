import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:seedbot/components/TextSimple.dart';
import 'package:seedbot/seedbot/ui/pages/MoveCommand/manuelle/MoveCmdCtrl.dart';
import 'package:seedbot/seedbot/ui/pages/parametrerobot/ParametrerobotPage.dart';

import '../../../../../components/IconImage.dart';
import '../../../../../utils/MyColor.dart';

class MoveCmdPage extends ConsumerStatefulWidget {
  const MoveCmdPage({super.key});

  @override
  ConsumerState createState() => _MoveCmdPAgeState();
}

class _MoveCmdPAgeState extends ConsumerState<MoveCmdPage> {
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var ctrl = ref.read(moveCommandCtrlProvider.notifier);
      ctrl.batterie('id');


    });

  }

  void dispose() {


    super.dispose();
  }
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  double _lowerValue = 50;
  double _upperValue = 180;
  bool b_marche = true;
  double _progress = 90;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      var ctrl = ref.read(moveCommandCtrlProvider.notifier);
      ctrl.batterie('id');});
    var state = ref.watch(moveCommandCtrlProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Seedbot"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {

             setState(() {
               ref.refresh(moveCommandCtrlProvider);
               var ctrl = ref.read(moveCommandCtrlProvider.notifier);

                ctrl.batterie('id');
             });
                // Exemple d'utilisation de Riverpod pour actualiser
            },
          ),
        ],
      ),
      body: Container(

        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: CircularSeekBar(
                width: double.infinity,
              
                height: 0,
                progress: _progress,
                barWidth: 15,
                startAngle: 90,
                sweepAngle: 180,
                strokeCap: StrokeCap.round,
                progressGradientColors: const [Colors.blue, Colors.indigo, Colors.purple],
                dashWidth: 50,
                dashGap: 15,
                animation: true,
                curves: Curves.bounceOut,
                valueNotifier: _valueNotifier,
                child: Center(
                  child: ValueListenableBuilder(
                      valueListenable: _valueNotifier,
                      builder: (_, double value, __) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextSimple(text:'${state.batterie} kg ',color: Colors.black, fontSize: 54, bold: true ),
                          TextSimple(text: "Poids des semences  ", color: Colors.black, fontSize: 24,),
              
              
                        ],
                      )),
                ),
              ),
              
              ),



            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,

              ),

              child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [

                        _shape( b_marche ? IconImage(file: "assets/images/buton_on.png",) : IconImage(file: "assets/images/button_off.png",), onTap: (){
                          var ctrl = ref.read(moveCommandCtrlProvider.notifier);
                          b_marche? ctrl.deconnexion("cette valeur") :ctrl.connectId("cette valeur");
                          //Navigator.push(context, MaterialPageRoute(builder:(ctx)=> ParametreerobotPage() ));
                          setState(() {
                            b_marche = !b_marche;
                            print(b_marche);
                          });
                        }),
                        TextSimple(text:b_marche ? "Off" : "On", color: Colors.black),
                        _shape( IconImage(file: "assets/images/batterie.png",)),
                      TextSimple(text: "85", color: Colors.black),
                        _shape( IconImage(file: "assets/images/arret_urgence.png")),

                    ],
                  ),

                  Container(
                    padding: EdgeInsets.all(3.0),





                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          _shape( IconImage(file: "assets/images/d_up-left.png",)),
                          _shape( IconImage(file: "assets/images/d_haut.png")),
                          _shape( IconImage(file: "assets/images/d_up_right.png")),
                        ],),        Row(children: [
                          _shape( IconImage(file: "assets/images/d_gauche-96.png")),
                          _shape( IconImage(file: "assets/images/stop_signal.png")),
                          _shape( IconImage(file: "assets/images/d_droite-96.png")),
                        ],),        Row(children: [
                          _shape( IconImage(file: "assets/images/d_bas_gauch.png")),
                          _shape( IconImage(file: "assets/images/d_bas.png")),
                          _shape( IconImage(file: "assets/images/d_bas_droite.png")),
                        ],),
                      ],
                    ),

                  )
                ],
              ),

            ],
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  _shape(IconImage(onTap: () {print("semer");
                  setState(() {



                  });},file: "assets/images/seed.png",color: MyColor.c5,)),

                  SizedBox(width: 5,),
                  _shape( IconImage(file: "assets/images/bouton_labourer2.png"),onTap: (){
                     var Ctrl = ref.read(moveCommandCtrlProvider.notifier);
                     Ctrl.SetSol("1");
                     Ctrl.batterie("id");
                  }),
                  SizedBox(width: 5,),
                  _shape( IconImage(file: "assets/images/parametre.png",color: MyColor.c5,),onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(ctx)=> ParametreerobotPage() ));
                  }),
                ],
              ),
            ),
            FlutterSlider(
              values: [_lowerValue,_upperValue],
              max: 500,
              min: 0,

              onDragging: (handlerIndex, lowerValue, upperValue) {
                _lowerValue = lowerValue;
                _upperValue = upperValue;
                print(handlerIndex);
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
  Widget _shape(Widget imageicon, {Function()? onTap}) {



    return  GestureDetector(
      onTap: onTap,

      child: Container(


        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(

          color: MyColor.white,
          boxShadow: [

            BoxShadow(
              color: Colors.black45,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 5),
            )
          ],

          border: Border.all(


            color: Colors.transparent,


          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: imageicon,
      ),
    );

  }
}
