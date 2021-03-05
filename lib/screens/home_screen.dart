import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:parxlab_application/models/User.dart';
import 'package:parxlab_application/services/response/records_response.dart';
import 'package:parxlab_application/widgets/app_bar.dart';
import 'package:parxlab_application/widgets/home_page_drawer.dart';
import 'package:parxlab_application/widgets/home_page_top_part.dart';
import 'package:parxlab_application/widgets/persistent_table_header.dart';
import 'package:parxlab_application/widgets/records_table.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements RecordsCallback {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  RecordsResponse _response;
  List<User> recordsList;

  _HomeScreenState() {
    _response = RecordsResponse(this);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      _showSnackBar("Giriş başarılı");
    });
    return Scaffold(
      key: scaffoldKey,
      drawer: HomePageDrawer(),
      appBar: buildHomePageAppBar(context, "ParxLab", Icons.logout),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: HomePageTopPart(
                icon: Icons.article,
                title: "Kayıtlar",
              ),
            ),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Container(
                      decoration: kRecordsTableDecoration,
                      child: FutureBuilder(
                        future: _response.getAllRecords(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.done:
                              return Scrollbar(
                                  thickness: 10.0,
                                  child: Stack(children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: FractionallySizedBox(
                                        widthFactor: 1,
                                        child: RecordsTable(
                                            recordsList: recordsList),
                                      ),
                                    ),
                                    PersistentTableHeader(
                                      header1: "Plaka",
                                      header2: "Görevli",
                                      header3: "Lokasyon",
                                    ),
                                  ]));
                              break;
                            default:
                              return Center(child: CircularProgressIndicator());
                              break;
                          }
                        },
                      )),
                )),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onError(String error) {
    _showSnackBar("Veriler yüklenemedi");
  }

  @override
  void onSuccess(List<User> userList) {
    recordsList = userList;
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(8.0),
      backgroundColor: Colors.blue,
      content: Text(text),
    ));
  }
}
