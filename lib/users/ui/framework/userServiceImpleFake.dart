

import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:seedbot/users/business/service/userService.dart';
import 'package:seedbot/utils/Endpoint.dart';

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
        print(" tokeneeeeee de gray $response.body");
        return 'Connexion réussie';
      } else {
        print(response.statusCode);
        return 'Erreur de connexion: ${response.reasonPhrase}';
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
        headers: {'Content-Type ':'multipart/form-data'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print(" tokeneeeeee de gray $response.body");
        return 'Connexion réussie';
      } else {
        print(response.statusCode);
        return 'Erreur de connexion: ${response.reasonPhrase}';
      }
    } catch (e) {
      // Handle any errors that occur during the request
      return 'Erreur: $e';
    }
  }


}
main() async{
  var data ={"email": "beni@gmail.com",
    "password": "12345678",
    "passwordConfirmation":"12345678"};
   var res =  await UserServiceImpleFake().CreerCompte(data);
   print(res);

}