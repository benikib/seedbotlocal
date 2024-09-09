import 'package:seedbot/users/business/service/userService.dart';

class DeconnexionUseCase{
  UserService service;
  DeconnexionUseCase(this.service);

  Future<String> run(data){
    return service.deconnexion(data);
  }

}