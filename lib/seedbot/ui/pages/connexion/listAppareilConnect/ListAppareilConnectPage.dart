


import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seedbot/components/IconImage.dart';
import 'package:seedbot/seedbot/ui/pages/parametrerobot/ParametrerobotPage.dart';
import 'package:seedbot/seedbot/ui/pages/wifi/ScanWifi.dart';
import 'package:seedbot/utils/MyColor.dart';

import '../../../../../../components/BottomNavigationBarApp.dart';
import '../../../../../components/Button.dart';
import '../../../../../components/CustomAppBar.dart';
import '../../../../../components/TextSimple.dart';
import '../../../../business/models/connexionAppareilModel/AppareilModel.dart';
import '../../MoveCommand/manuelle/MoveCmdPage.dart';
import '../../MoveCommand/manuelle/MoveCommandPage.dart';
import 'ListAppareilConnectCtrl.dart';

class ListAppareilConnectPage extends ConsumerStatefulWidget {
  const ListAppareilConnectPage({super.key});

  @override
  ConsumerState createState() => _ListAppareilConnectPageState();
}

class _ListAppareilConnectPageState extends ConsumerState<ListAppareilConnectPage> {
  int? _indexrobot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var ctrl = ref.read(listAppareilConnectCtrlProvider.notifier);
      ctrl.recuperAppareilConnect();

    });
  }
  @override
  Widget build(BuildContext context) {
    bool _selection = false;
    int _indexrobot ;
    TextEditingController textController = TextEditingController();
    var state = ref.watch(listAppareilConnectCtrlProvider);
    return Scaffold(


      appBar: CustomAppBar(
        title: "Seedbot",
      ),
      body:  Container(

          height: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/champ_seedbdot.png"),
                fit: BoxFit.cover,
              ),
            ),

              child: SingleChildScrollView(
                child: Column(
                
                
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    //_logo(),
                    _searchBar(textController),
                
                
                
                
                
                    if(state.isLoading) CircularProgressIndicator(),
                    if(state.data.length == 0) _attente(),
                
                    _ajouterAppareil(),
                
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: TextSimple(text: "Smart service", color: Colors.black),
                    ),
                    _appareils(state.data),
                
                
                  ],
                
                            ),
              ),
          ),
        
      ),
    );
  }


Widget _ajouterAppareil() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: GestureDetector(
          onTap: (){


            Navigator.push(context, MaterialPageRoute(builder:(ctx)=> ScanWifi() ));
          },
          child: Container(




            decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(


            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.add),),
              Text("Ajouter un appareil"),
            ],




            ),),
        )
      ),
    );


}
Widget _attente() {
    return Center(

        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Text("Aucun appareil"),
        )
    );
  }




  ListAppareil(List<AppareilModel> data) {

    return

          Expanded(


            child: ListView.builder(

              scrollDirection: Axis.vertical,

              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    var ctrl = ref.read(listAppareilConnectCtrlProvider.notifier);
                    //ctrl.connectId("cette valeur");
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Center(child: const TextSimple(color: Colors.black, fontSize: 20, bold: true, text: 'MODE',)),
                        content: TextSimple(color: Colors.black, fontSize: 20,  text: 'Choissez le mode pour commander',),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () { Navigator.push(context, MaterialPageRoute(builder:(ctx)=> MoveCommandPage() ));},
                            child: TextSimple(text: 'Manuelle', color : MyColor.c4,),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'AutoCmdPage'),
                            child: TextSimple(text: 'Automatique', color : MyColor.c3,),
                          ),
                        ],
                      ),
                    );
                  },

                  child: Padding(
                    padding: const EdgeInsets.symmetric( horizontal: 8.0,vertical: 8.0 ),//EdgeInsets.all(40.0),
                    child: Container(

                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              IconImage(file: "assets/images/bot.png",),

                              TextSimple(text: data[index].ssid.toString(), color: Colors.black, fontSize: 20),

                            ]),
                          ),
                          Divider(color: Colors.black45,
                            thickness: 2,
                          ),

                        ]          ),




                    ),)

                );
              },
                )

    );
}


  _searchBar(textController) {
    return

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),

            child: AnimSearchBar(
              width: 400.0,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              }, onSubmitted: (String ) {  },
              rtl: true,),


        );
  }

   Widget _appareils(List<AppareilModel> data) {
    return Container(

        margin: EdgeInsets.all(20.0),

        height: 300,
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListAppareil(data),
          ],




        ),


    );
  }

}

