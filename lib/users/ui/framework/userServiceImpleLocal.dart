import 'dart:async';

import 'package:seedbot/users/business/service/usersServiceLocal.dart';
import 'package:sembast/sembast.dart';

class UserServiceImplLocal implements UsersServiceLocal {

  Database db;
  String userKey = 'UserKey';
  String tokenKey = 'TOKENKey';

  var stockage = StoreRef.main();
  UserServiceImplLocal(this.db);

  @override
  Future<Map<String, dynamic>?> getToken(Map<String, dynamic> data) async{
    var data = await stockage.record(userKey).get(db) as Map?;
    print("data local uer $data");
    return Future.value((data ?? {"id": 0}) as FutureOr<Map<String, dynamic>?>?);
  }

  @override
  Future<bool> recuperationUser(data) async{
    print("User ${data.toJson()}");
    await stockage.record(userKey).put(db, data.toJson());

    return true;
  }

  @override
  Future<bool> saveUser(dynamic data) async {
    //print("User ${data.toJson()}");
    await stockage.record(userKey).put(db, data.toJson());

    return true;
  }
  @override
  Future<bool> saveTokenCode(String data) async {
    await stockage.record(tokenKey).put(db, data);
    return true;
  }

  @override
  Future<bool> deconnexion(data) async{
    await stockage.record(userKey).delete(db);
    await stockage.record(tokenKey).delete(db);
    return true;
  }

  @override
  Future<String?> recupererToken() {
    // TODO: implement recupererToken
    throw UnimplementedError();
  }
}