
import 'package:flutter/foundation.dart';

abstract  class UserService{
   Future<String> authentification(data);
   Future<String> deconnexion(data);
   Future<String> forgetPassword(data);
   Future<String> CreerCompte(data);
   Future<dynamic> Categories();


}