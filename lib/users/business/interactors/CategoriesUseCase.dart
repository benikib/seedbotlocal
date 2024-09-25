import 'dart:developer';

import 'package:seedbot/users/business/models/CategoriesModel.dart';

import '../../ui/framework/userServiceImpleFake.dart';
import '../service/userService.dart';

class CategoriesUseCase {
  UserService service;
  CategoriesUseCase(this.service);
  Future<CategoriesModel?> run()async{
    return await  service.Categories();
  }

}
