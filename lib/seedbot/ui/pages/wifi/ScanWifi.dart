import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seedbot/utils/MyColor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wifi_scan/wifi_scan.dart';

import '../../../../components/CustomAppBar.dart';
import '../../../../components/TextSimple.dart';

class ScanWifi extends ConsumerStatefulWidget {
   ScanWifi({super.key});



  @override
  ConsumerState createState() => _ScanWifiState();

}

class _ScanWifiState extends ConsumerState<ScanWifi> {
  TextEditingController textController = TextEditingController();
  List<WiFiAccessPoint> accessPoints = <WiFiAccessPoint>[];
  bool shouldCheckCan = true;
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: CustomAppBar(
        title: "Seedbot",
      ),
      body:  SlidingUpPanel(
    // making false it does
    // not render outside
    renderPanelSheet: false,
    // panel
    panel:  Container(
    decoration: const BoxDecoration(
    color: Color.fromARGB(255, 253, 253, 253),
    borderRadius: BorderRadius.all(Radius.circular(24.0)),
    boxShadow: [
    BoxShadow(
    blurRadius: 20.0,
    color: Colors.grey,
    ),
    ]),
    margin: const EdgeInsets.all(24.0),
    child:  Center(
      child: accessPoints.isEmpty
          ? GestureDetector(child:  TextSimple(text: "Aucun reseau", color: Colors.black),onTap: () async => _getScannedResults(context),)
          : ListView.builder(
          itemCount: accessPoints.length,
          itemBuilder: (context, i) =>
              _AccessPointTile(accessPoint: accessPoints[i])),
    ),
    ),
    // collapsed
    collapsed:Container(
    decoration: const BoxDecoration(
    color: MyColor.c1,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
    ),
    margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    child: Center(
      child: TextSimple(text: "Wi-fi à proximité",color: Colors.white,)

    ),
    ) ,
    body:_body(),

      ),
    );
  }
  _body(){
    return Container(

      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_wifi.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //_logo(),
                _searchBar(),
              _planification(),

            ],
          ),
        ),
      ),



    );
  }
  Widget _planification() {
    return Padding(

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

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.document_scanner_rounded),)),
                Text("Ajouter un appareil"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(

                    children: [
                      Icon(Icons.arrow_forward_ios),
                      Icon(Icons.arrow_forward_ios,color: Colors.black45,),

                    ],
                  ),
                ),
              ],




            ),),
        )
    );


  }

  _searchBar() {
    return

      Padding(
        padding: const EdgeInsets.only(right: 8.0),
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

  _wifi_procher(){

    return SlidingUpPanel(
      // making false it does
      // not render outside
      renderPanelSheet: false,
      // panel
      panel:  Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 253, 253, 253),
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: Colors.grey,
              ),
            ]),
        margin: const EdgeInsets.all(24.0),
        child: const Center(
          child: Text("Pas de Wifi à proximative"),
        ),
      ),
      // collapsed
      collapsed:Container(
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        ),
        margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
        child: const Center(
          child: Text(
            "This is the collapsed Widget",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ) ,
      body: const Center(
        child: Text(
            "This the widget behind the Sliding panel"),
      ),


    );
  }

  Future<void> _getScannedResults(BuildContext context) async {

    if (await _canGetScannedResults(context)) {
      // get scanned results
      final results = await WiFiScan.instance.getScannedResults();
      setState(() => accessPoints = results);
    }
  }

  Future<bool> _canGetScannedResults(BuildContext context) async {
    if (shouldCheckCan) {
      // check if can-getScannedResults
      final can = await WiFiScan.instance.canGetScannedResults();
      // if can-not, then show error
      if (can != CanGetScannedResults.yes) {
        if (mounted) kShowSnackBar(context, "Cannot get scanned results: $can");
        accessPoints = <WiFiAccessPoint>[];
        return false;
      }
    }
    return true;
  }
  void kShowSnackBar(BuildContext context, String message) {
    if (kDebugMode) print(message);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }


  }
class _AccessPointTile extends StatelessWidget {
  final WiFiAccessPoint accessPoint;

  const _AccessPointTile({Key? key, required this.accessPoint})
      : super(key: key);

  // build row that can display info, based on label: value pair.
  Widget _buildInfo(String label, dynamic value) => Container(
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey)),
    ),
    child: Row(
      children: [
        Text(
          "$label: ",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(child: Text(value.toString()))
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final title = accessPoint.ssid.isNotEmpty ? accessPoint.ssid : "**EMPTY**";
    final signalIcon = accessPoint.level >= -80
        ? Icons.signal_wifi_4_bar
        : Icons.signal_wifi_0_bar;
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: Icon(signalIcon),
      title: Text(title),
      subtitle: Text(accessPoint.capabilities),
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInfo("BSSDI", accessPoint.bssid),
              _buildInfo("Capability", accessPoint.capabilities),
              _buildInfo("frequency", "${accessPoint.frequency}MHz"),
              _buildInfo("level", accessPoint.level),
              _buildInfo("standard", accessPoint.standard),
              _buildInfo(
                  "centerFrequency0", "${accessPoint.centerFrequency0}MHz"),
              _buildInfo(
                  "centerFrequency1", "${accessPoint.centerFrequency1}MHz"),
              _buildInfo("channelWidth", accessPoint.channelWidth),
              _buildInfo("isPasspoint", accessPoint.isPasspoint),
              _buildInfo(
                  "operatorFriendlyName", accessPoint.operatorFriendlyName),
              _buildInfo("venueName", accessPoint.venueName),
              _buildInfo("is80211mcResponder", accessPoint.is80211mcResponder),
            ],
          ),
        ),
      ),
    );
  }



}
