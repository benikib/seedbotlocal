import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../components/IconImage.dart';
import '../../../../../components/TextSimple.dart';
import '../../../../../utils/MyColor.dart';
import '../../parametrerobot/ParametrerobotPage.dart';

class AutoCmdPage extends ConsumerStatefulWidget {
  const AutoCmdPage({super.key});

  @override
  ConsumerState createState() => _AutocmdpageState();
}

class _AutocmdpageState extends ConsumerState<AutoCmdPage> {

  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  double _lowerValue = 50;
  double _upperValue = 180;
  bool b_marche = true;
  double _progress = 90;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seedbot"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(

            children: [

              Container(
                height:320 ,
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
                              TextSimple(text:'${value} kg ',color: Colors.black, fontSize: 54, bold: true ),
                              TextSimple(text: "Poids des semences  ", color: Colors.black, fontSize: 24,),
                              SizedBox(height: 20,),
                              Container(
                                width: double.infinity,
                                height: 50,


                                child: ElevatedButton(onPressed: ()async{
            final Uri _url = Uri.parse('https://flutter.dev');
            if ( await launchUrl(_url)) {
            throw Exception('Could not launch $_url');}
                                }, style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black12,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )
                                ), child: Text("Tracer une trajetoire"),)






                                ),

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(

                        children: [


                  _shape( b_marche ? IconImage(file: "assets/images/buton_on.png",) : IconImage(file: "assets/images/button_off.png",), onTap: (){
         // var ctrl = ref.read(moveCommandCtrlProvider.notifier);
          //b_marche? ctrl.deconnexion("cette valeur") :ctrl.connectId("cette valeur");
          //Navigator.push(context, MaterialPageRoute(builder:(ctx)=> ParametreerobotPage() ));
          setState(() {
            b_marche = !b_marche;
            print(b_marche);
          });}),
                          SizedBox(height: 10,),
                          _shapebouton( IconImage(file: "assets/images/batterie.png",)),
                          SizedBox(height: 10,),
                          _shapebouton( IconImage(file: "assets/images/arret_urgence.png")),

                        ],
                      ),

                      Expanded(



                         child: IconImage(file: "assets/images/arret_urgence.png",color: MyColor.c5,),



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

                    _shapebouton(IconImage(onTap: () {print("semer");
                    setState(() {



                    });},file: "assets/images/seed.png",color: MyColor.c5,)),

                    SizedBox(width: 5,),
                    _shapebouton( IconImage(file: "assets/images/bouton_labourer2.png")),
                    SizedBox(width: 5,),
                    _shapebouton( IconImage(file: "assets/images/parametre.png",color: MyColor.c5,),onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(ctx)=> ParametreerobotPage() ));
                    }),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget _shapebouton(Widget imageIcon, {Function()? onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0), // Espacement interne
        shape: CircleBorder(), // Forme circulaire
         // Couleur de fond
        shadowColor: Colors.black45, // Couleur de l'ombre
        elevation: 5, // Élévation (ombre portée)
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: imageIcon, // Icône ou image passée en argument
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
Future<void> _launchUrl() async {
  final Uri _url = Uri.parse('https://flutter.dev');
  if ( await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}