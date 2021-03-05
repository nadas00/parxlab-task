import 'package:flutter/material.dart';
import 'package:parxlab_application/models/User.dart';
import 'package:parxlab_application/services/response/login_response.dart';

import '../constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginCallBack {
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _nickname, _password;
  LoginResponse _response;

  _LoginScreenState() {
    _response = LoginResponse(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double verticalPadding = constraints.maxHeight * .15;
          double horizontalPadding = constraints.maxWidth * .04;
          return Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: verticalPadding, horizontal: horizontalPadding),
              child: Container(
                  decoration: kLoginFormDecoration,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "ParxLab",
                            style: TextStyle(fontSize: 30.0),
                          ),
                          TextFormField(
                            onSaved: (val) => _nickname = val,
                            decoration: InputDecoration(
                                labelText: "Kullanıcı Adı",
                                labelStyle: kLoginFormLabelTextStyle),
                          ),
                          TextFormField(
                            onSaved: (val) => _password = val,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "Parola",
                                labelStyle: kLoginFormLabelTextStyle),
                          ),
                          FractionallySizedBox(
                            widthFactor: 1,
                            child: RaisedButton(
                              disabledColor: Colors.grey.withOpacity(0.5),
                              onPressed: !_isLoading ? () => _submit() : null,
                              color: Colors.blue,
                              child: !_isLoading
                                  ? Text(
                                      "Giriş Yap",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: CircularProgressIndicator()),
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) {
    if (user != null) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.id);
    } else {
      _showSnackBar("Kullanıcı Adı: erhan.erdogan, Parola: parxlab");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _response.finishLogin(_nickname, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(8.0),
      content: Text(text),
    ));
  }
}
