

import 'dart:convert';

import 'package:http/http.dart' as http;



import 'package:seedbot/users/business/service/userService.dart';
import 'package:seedbot/utils/Endpoint.dart';

import '../../business/models/CategoriesModel.dart';

class UserServiceImpleFake implements UserService{
  @override
  Future<String> authentification( data) async {
    final url = Uri.parse(Endpoint.baseUrlLogin);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print(" tokeneeeeee de gray ${response.body}");
        return response.body.toString();
      } else {
        print(response.statusCode);
        return 'Erreur de connexion: ${(response.body)}';
      }
    } catch (e) {
      // Handle any errors that occur during the request
      return 'Erreur: $e';
    }
  }


  @override
  Future<String> deconnexion(data) {

    return Future.value('deconnexion');
  }

  @override
  Future<String> forgetPassword(data) {

    return Future.value('Mot de passe Initialise');
  }

  @override
  Future<String> CreerCompte(data) async{

    final url = Uri.parse(Endpoint.baseUrlEnregister);
    print(url);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type':'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print(" tokeneeeeee de gray ${response.body}");
        return response.body.toString();
      } else {
        print(response.statusCode);
        return 'Erreur de connexion: ${response.body}';
      }
    } catch (e) {
      // Handle any errors that occur during the request
      return 'Erreur: $e';
    }
  }

  @override
  Future <CategoriesModel?> Categories() async {
    final url = Uri.parse(Endpoint.baseUrlCategories);
    print(url);

    try {
      final response = await http.get(
        url,
        headers: {'Content-Type':'application/json'},

      );

      if (response.statusCode == 200) {
        print(" tokeneeeeee de gray ${response.body}");
        return CategoriesModel.fromJson(jsonDecode(response.body));
      } else {
        print(response.statusCode);
        return  null ;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      return null;
    }
  }

  @override
  Future<dynamic> Notification(data) {

    final List<Map<String, dynamic>> data = [
      {
        'id': '1',
        'titre': 'Nouvelle mise à jour',
        'message': 'La version 1.1 est maintenant disponible.',
        'date': DateTime.now().toString(),
        'type': 'info',
        'vue': false,
      },
      {
        'id': '2',
        'titre': 'Attention!',
        'message': 'Votre abonnement expire bientôt.',
        'date': DateTime.now().subtract(Duration(days: 2)).toString(),
        'type': 'warning',
        'vue': false,
      },
      {
        'id': '3',
        'titre': 'Erreur critique',
        'message': 'Une erreur inattendue est survenue.',
        'date': DateTime.now().subtract(Duration(days: 5)).toString(),
        'type': 'error',
        'vue': true,
      },
    ];

    return Future.value(data);
  }


}
