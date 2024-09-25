import 'package:seedbot/users/business/service/userService.dart';
import 'package:seedbot/users/business/service/usersServiceLocal.dart';

class SaveTokenUseCase{
  UsersServiceLocal service;
  SaveTokenUseCase(this.service);

  Future<bool> run(data){
    return service.saveTokenCode(data);
  }

}