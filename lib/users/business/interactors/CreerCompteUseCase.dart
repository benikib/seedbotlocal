
import '../service/userService.dart';

class CreerCompteUseCase{

  UserService service;
  CreerCompteUseCase(this.service);
  Future<String> run(data){
    return service.CreerCompte(data);
  }
}