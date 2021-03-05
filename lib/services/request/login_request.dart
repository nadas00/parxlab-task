import 'package:parxlab_application/data/query/db_query.dart';
import 'package:parxlab_application/models/User.dart';

class LoginRequest {
  DbQuery con = DbQuery();

  Future<User> loginUser(String nickname, String password) {
    var result = con.loginUser(nickname, password);
    return result;
  }
}
