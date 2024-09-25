 abstract class UsersServiceLocal{
   Future<bool> recuperationUser(data);
   Future<bool> deconnexion(data);
   //Future<String> forgetPassword(data);
   //Future<String> CreerCompte(data);
   Future<String?> recupererToken();
   Future<bool> saveTokenCode(String data);
   Future<bool> saveUser(Map data);

 }