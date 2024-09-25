import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seedbot/Navigator/GoRouter.dart';
import 'package:seedbot/components/Button.dart';
import 'package:seedbot/components/TextSimple.dart';
import 'package:seedbot/users/ui/pages/pageIntros/IntroCtrl.dart';

import '../../../../components/CustomAppBar.dart';
import '../authentification/authentificationPage.dart';

class Intro extends ConsumerStatefulWidget {
  const Intro({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Intro> {
  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var ctrl = ref.read(introCtrlProvider.notifier);
      ctrl.categories();

    });
  }
  @override
  Widget build(BuildContext context) {
   var state = ref.watch(introCtrlProvider);
    return Scaffold(
      appBar: CustomAppBar(title: 'SeedBot',etat: false),
      body: Center(
        child: SingleChildScrollView(

            child: Container(
                padding: EdgeInsets.all(20.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(margin: EdgeInsets.all(20),child: TextSimple(text: " Nos produits (${state.data.length})", color: Colors.black, fontSize: 30, )),
                  const SizedBox(height: 16.0),
                  state.isLoading? Container(
                    height: 400,child: Center(child: CircularProgressIndicator(color: Colors.black,))):  FlutterCarousel(
                  options: CarouselOptions(

                    height: 400.0,
                    showIndicator: true,
                    slideIndicator: CircularSlideIndicator(),
                  ),
                  items: state.data.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          padding:EdgeInsets.all( 20.0) ,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(30.0),

                          ),

                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextSimple(text: '${i.category.designation}', color: Colors.black, fontSize: 20, bold: true),
                                Image(image: NetworkImage(i.category.categoryImage),height: 200,width: 700,),
                                TextSimple(text: i.category.description , color: Colors.black)
                              ]
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                  SizedBox(height: 20),
                  Center(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Button(text: " Connexion ", onPressed: (){
                          context.goNamed(Urls.authentification.name);
                          print("data  categories : ${state.data}");
                          //context.goNamed(Urls.authentification.name);
                            },),
                          SizedBox(height: 20),
                          Button(text
                        : "Inscription", onPressed: (){context.goNamed(Urls.creercompte.name);}),
                      ],),
                  )

                ],
              ),
            ),
          ),
      ),
    );
  }
  void _onBackToIntro(context) {
    //OnBoardingPage
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const AuthentificationPage()),
    );
  }
}
