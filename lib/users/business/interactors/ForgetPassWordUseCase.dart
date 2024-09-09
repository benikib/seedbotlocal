import 'package:seedbot/users/business/service/userService.dart';

class ForgetPassWordUseCase{
  UserService service;
  ForgetPassWordUseCase(this.service);

  Future<String> run(data){
    return service.forgetPassword(data);
  }
}