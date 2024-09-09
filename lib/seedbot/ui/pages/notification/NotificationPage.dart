import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/components/TextSimple.dart';

import '../../../../components/BottomNavigationBarApp.dart';
import '../../../../components/Button.dart';
import '../../../../components/CustomAppBar.dart';
import '../../../../components/ImageAsset.dart';
import '../../../../utils/MyColor.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    appBar: CustomAppBar(

      title: "Seedbot",
    ),
    body:  Center(
      child:  Column(

        children: [

               _aucune_notification(),
              ],
            ),

    ));
          // appareil(),




  }
  _aucune_notification() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 50),
        child: Column(
          children: [
            ImageAsset(file:"assets/images/clocheseedbot.png",width: 200),
            SizedBox(height: 20),
            Text("Vous n'avez pas encore de notifications",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text("Quand vous en aurez elles s' afficheront ici",style: TextStyle(fontSize: 18),),
            SizedBox(height: 20),
            Button(text: "Reffraichir", onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
