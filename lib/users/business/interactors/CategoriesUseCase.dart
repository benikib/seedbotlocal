import 'dart:developer';

import '../service/userService.dart';

class CategoriesUseCase {
  UserService service;
  CategoriesUseCase(this.service);
  Future<dynamic> run()async{
    return await  service.Categories();
  }
}