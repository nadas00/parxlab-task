class User {
  int _id;
  String _userName;
  String _password;
  String _licensePlate;
  String _latitude;
  String _longitude;
  String _nickName;

  User(this._userName, this._password, this._licensePlate, this._latitude,
      this._longitude, this._nickName);

  User.fromMap(dynamic obj) {
    this._userName = obj["userName"];
    this._nickName = obj["nickName"];
    this._licensePlate = obj["licensePlate"];
    this._latitude = obj["latitude"];
    this._longitude = obj["longitude"];
  }

  String get userName => _userName;

  String get password => _password;

  String get licensePlate => _licensePlate;

  String get latitude => _latitude;

  String get longitude => _longitude;

  Map<String, dynamic> toMap() {
    var userMap = Map<String, dynamic>();
    userMap["userName"] = _userName;
    userMap["password"] = _password;
    userMap["licensePlate"] = _licensePlate;
    userMap["latitude"] = _latitude;
    userMap["longitude"] = _longitude;
    userMap["nickName"] = _nickName;
    return userMap;
  }
}
