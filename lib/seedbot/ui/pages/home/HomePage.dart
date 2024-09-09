import 'dart:developer';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:seedbot/components/BottomNavigationBarApp.dart';
import 'package:seedbot/components/CustomAppBar.dart';

import '../../../../components/SmartService.dart';
import '../../../../utils/MyColor.dart';
import 'HomeCtrl.dart';



class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool buttom = false;
  bool swicth= true;

@override
  void initState() {

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var ctrl = ref.read(homeCtrlProvider.notifier);

    });
  }





  void commande(bool value) {
    setState(() {
      var ctrl = ref.read(homeCtrlProvider.notifier);

      ctrl.commandeSemer(value: value);



    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeCtrlProvider);

    return Scaffold(

      bottomNavigationBar: BottomNavigationBarApp(),
      appBar: CustomAppBar(
        title: "Seedbot",
      ),
      body:  Column(

        children: [

          //_logo(),
          _searchBar(),

          SizedBox(height: 20),

         // appareil(),


        ],
      ),
    );
  }










  _searchBar() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
            );
          }, suggestionsBuilder: (BuildContext context, SearchController controller) {

          return const [];
        },
        ),
      );
    }
  }
