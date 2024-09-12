import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:seedbot/components/Button.dart';
import 'package:seedbot/users/ui/pages/pageIntros/IntroCtrl.dart';

import '../authentification/authentificationPage.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
     // var ctrl = ref.read(IntroCtrlProvider.notifier);
      //ctrl.categories();

    });
  }
  @override
  Widget build(BuildContext context) {
    //svar state = ref.watch(IntroCtrlProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            FlutterCarousel(
              options: CarouselOptions(
                height: 400.0,
                showIndicator: true,
                slideIndicator: CircularSlideIndicator(),
              ),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        padding:EdgeInsets.all( 20.0) ,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30.0),

                        ),
                        child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(text: " Connexion ", onPressed: (){_onBackToIntro(context);},),
                Button(text: "Inscription", onPressed: (){}),
              ],)

          ],
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
