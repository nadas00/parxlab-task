import 'package:parxlab_application/models/User.dart';
import 'package:parxlab_application/services/request/login_request.dart';

abstract class LoginCallBack {
  void onLoginSuccess(User user);

  void onLoginError(String error);
}

class LoginResponse {
  LoginCallBack _callBack;
  LoginRequest loginRequest = LoginRequest();

  LoginResponse(this._callBack);

  finishLogin(String nickname, String password) {
    loginRequest
        .loginUser(nickname, password)
        .then((user) => _callBack.onLoginSuccess(user))
        .catchError((onError) => _callBack.onLoginError(onError.toString()));
  }
}
