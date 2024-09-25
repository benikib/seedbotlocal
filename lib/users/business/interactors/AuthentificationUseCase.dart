import 'package:seedbot/users/business/interactors/UserInteractor.dart';
import 'package:seedbot/users/business/service/userService.dart';
import 'package:seedbot/users/business/service/usersServiceLocal.dart';

class AuthentificationUseCase {
  UserService service;
  
  
  AuthentificationUseCase(this.service);
   Future<String> run(data){
       var res =service.authentification(data);


     return service.authentification(data);
   }
}