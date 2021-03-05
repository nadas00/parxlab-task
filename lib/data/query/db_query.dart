import 'package:parxlab_application/data/database_helper.dart';
import 'package:parxlab_application/models/User.dart';
import 'dart:async';

class DbQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<User> loginUser(String nickname, String password) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM user WHERE nickName = '$nickname' and password = '$password'");
    if (res.length > 0) {
      return new User.fromMap(res.first);
    }
    return null;
  }

  Future<List<User>> getAllUser() async {
    var dbClient = await con.db;
    var res = await dbClient.query("user");
    List<User> userList =
        res.isNotEmpty ? res.map((u) => User.fromMap(u)).toList() : null;
    return userList;
  }
}
