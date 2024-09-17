import 'package:seedbot/users/business/service/usersServiceLocal.dart';

class UserServiceImplLocal implements UsersServiceLocal {


  @override
  Future<String> authentification(data) {

    return Future.value("authentification");
  }

  @override
  Future<String> recuperationUser(data) {
    // TODO: implement recuperationUser
    throw UnimplementedError();
  }
}