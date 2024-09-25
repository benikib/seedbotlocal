
import '../service/usersServiceLocal.dart';

class SaveUseCase {

  UsersServiceLocal service;
  SaveUseCase(this.service);
  Future<bool> run(data){

    return service.saveUser(data);
  }
}