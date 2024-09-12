

import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:wifi_scan/wifi_scan.dart';

import '../../business/models/connexionAppareilModel/AppareilModel.dart';
import '../../business/service/SeedbotService.dart';

class SeedbotServiceImplLocal implements SeedbotService{
  @override
  Future etablirConnexionService(EtablirConnexionModel) {
    // TODO: implement etablirConnexionService
    throw UnimplementedError();
  }

  @override
  Future<List<AppareilModel>> recupereAppareil() async{
    var data = [{
      "ssid": "seedbot v1",
      "rssi": "rssi",
      "isSecure": "isSecure",
    },{
      "ssid": "seedbot v2",
      "rssi": "rssi",
      "isSecure": "isSecure",
    },{
      "ssid": "seedbot v3",
      "rssi": "rssi",
      "isSecure": "isSecure",
    },{
      "ssid": "seedbot v4",
      "rssi": "rssi",
      "isSecure": "isSecure",
    }];

    return Future.value(List.from(data.map((e) => AppareilModel.fromJson(e))));
  }

  @override
  Future<bool> semerd(bool res) async{
   String url = "https://192.168.4.1";
    await Future.delayed(Duration(seconds: 6));
    return Future.value(res);
  }



  Future<bool> semerm(bool value) async{
  String data;

    value ? data="on" :data = "off";
  final url = Uri.parse('http://192.168.4.1/$data');
    try {
      // Convertir les données en JSON
      final body = jsonEncode(data);

      // Effectuer la requête POST avec le corps de la requête
      final response = await http.post(url, body: body, headers: {'Content-Type': 'application/json'});

      // Vérifier le code de statut de la réponse
      if (response.statusCode == 200) {
        // Convertir le corps de la réponse en un Map
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        return true;
      } else {
        // En cas d'erreur, retourner une erreur
        throw Exception('Echec de la requête : ${response.statusCode}');
      }
    } catch (e) {
      print('error $e');
      return false;
    }
  }

  @override
  Future<bool> labourer(bool res) {
    // TODO: implement labourer
    throw UnimplementedError();
  }

  @override
  Future<bool> moveCommand(data) {

    return Future.value(true);
  }

  @override
  Future<bool> semer(bool res) {
    bool val = res;
    return Future.value(val?true:false);
  }



  }




  Future<Map<String, dynamic>> fetchData() async {
    // Définir l'URL de la requête
    final url = Uri.parse('https://api.example.com/data');

    try {
      // Effectuer la requête GET
      final response = await http.get(url);

      // Vérifier le code de statut de la réponse
      if (response.statusCode == 200) {
        // Convertir le corps de la réponse en un Map
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data;
      } else {
        // En cas d'erreur, retourner une erreur
        throw Exception('Echec de la requête : ${response.statusCode}');
      }
    } catch (e) {
      // Gérer les erreurs de connexion
      rethrow;
    }

  }

void main() {


}
  
