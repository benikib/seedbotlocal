import '../service/usersServiceLocal.dart';

class RecuperTokenUseCase{

  UsersServiceLocal service;
  RecuperTokenUseCase(this.service);
    Future<String?> run() async{
      var res= await service.recupererToken();
      print(' usease $res');
    return  res;
  }
}