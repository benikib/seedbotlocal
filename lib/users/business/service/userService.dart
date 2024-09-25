
import 'package:flutter/foundation.dart';

import '../models/CategoriesModel.dart';

abstract  class UserService{
   Future<String> authentification(data);
   Future<String> deconnexion(data);
   Future<String> forgetPassword(data);
   Future<String> CreerCompte(data);
   Future<CategoriesModel?> Categories();
   Future<dynamic> Notification(data);


}