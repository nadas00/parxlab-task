import 'package:parxlab_application/data/query/db_query.dart';
import 'package:parxlab_application/models/User.dart';

class RecordsRequest {
  DbQuery con = DbQuery();

  Future<List<User>> getAllRecords() async {
    var result = await con.getAllUser();
    return result;
  }
}
