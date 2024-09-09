import 'package:seedbot/users/business/service/userService.dart';

class AuthentificationUseCase {
  UserService service;
  
  AuthentificationUseCase(this.service);
   Future<String> run(data){
   //  var  data = {"email": "mail1@mail.com", "password": "12345678"};
     return service.authentification(data);
   }
}