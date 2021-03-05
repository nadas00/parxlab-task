import 'package:parxlab_application/models/User.dart';
import 'package:parxlab_application/services/request/records_request.dart';

abstract class RecordsCallback {
  void onSuccess(List<User> userList);

  void onError(String error);
}

class RecordsResponse {
  RecordsCallback _callBack;
  RecordsRequest recordsRequest = RecordsRequest();

  RecordsResponse(this._callBack);

  Future<dynamic> getAllRecords() async {
    await recordsRequest
        .getAllRecords()
        .then((userList) => _callBack.onSuccess(userList))
        .catchError((onError) => _callBack.onError(onError.toString()));
  }
}
