import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/components/TextSimple.dart';

import '../../../../components/BottomNavigationBarApp.dart';
import '../../../../components/Button.dart';
import '../../../../components/CustomAppBar.dart';
import '../../../../components/IconImage.dart';
import '../../../../components/ImageAsset.dart';
import '../../../../utils/MyColor.dart';
import 'NotificationCtrl.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
     var ctrl = ref.read(notificationCtrlProvider.notifier);
      ctrl.notification();

    });
  }
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(notificationCtrlProvider);
    return  Scaffold(

    appBar: CustomAppBar(
      etat: false,

      title: "Seedbot ",
    ),
          body: SafeArea(child: Stack(children: <Widget>[
            _title(( state.data.length)),
            _notification(state.data),

          ],)),

    );


          // appareil(),




  }

  _aucune_notification() {

    return Container(
      child: Center(
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
              Button(text: "Reffraichir", onPressed: (){var ctrl = ref.read(notificationCtrlProvider.notifier);
              ctrl.notification();}),
            ],
          ),
        ),
      ),
    );
  }
  _notification(notifications) {
    return  Container(
      margin: EdgeInsets.only(top:70),
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Container(

            color: MyColor.c5,
            margin: EdgeInsets.symmetric(vertical: 2.0,),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              title: Text(notification['titre']),
              subtitle: Text(notification['message']),

              leading:  IconImage(file: "assets/images/bot.png",),
              onTap: () {
                // Action sur la notification
              },
            ),
          );
        },

      ),
    );

  }
_title(tail){
    return

         Container(
             margin: EdgeInsets.all(20),
             child: TextSimple(color: Colors.black, fontSize: 30, text: 'Notification ( ${tail}) ',));

}
  }
