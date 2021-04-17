import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/app/travel_view.dart';
import 'package:http/http.dart' as Http;
import '../Login/components/background.dart';
// ignore: unused_import
import 'package:flutter_search_bar/flutter_search_bar.dart';

class TravelPage extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Search Bar Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  var jsonData;
  SearchBar searchBar;
  String searchKey = "";
  List<TempleData> templeList = [];

  // ignore: unused_field
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text('Travel Sisaket'),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  void onSubmitted(String value) {
    setState(() {
      searchKey = value;
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text('You search for $value!')));
    });
  }

  _TravelPageState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("Closed");
        });
  }

  // ignore: non_constant_identifier_names
  Future<String> _getTravelAPI() async {
    var response =
        await Http.get('https://sarawut1107.github.io/templel/templel.json');

    jsonData = json.decode(utf8.decode(response.bodyBytes));
    for (var item in jsonData) {
      TempleData templeData = TempleData(
          item['order'],
          item['name'],
          item['maestro'],
          item['detail'],
          item['latitude'],
          item['longitude'],
          item['img']);
      templeList.add(templeData);
    }

    return 'jsonData';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body: Background(
        child: FutureBuilder(
          future: _getTravelAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: templeList.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // ignore: missing_required_param
                                builder: (context) => TravelViewPage(
                                    name: templeList[index].name,
                                    maestro: templeList[index].maestro,
                                    detail: templeList[index].detail,
                                    img: templeList[index].img)));
                      },
                      child: ListTile(
                        title: Text("${jsonData[index]['name']}"),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class TempleData {
  int order;
  String name;
  String maestro;
  String detail;
  double latitude;
  double longitude;
  String img;

  TempleData(
    this.order,
    this.name,
    this.maestro,
    this.detail,
    this.latitude,
    this.longitude,
    this.img,
  );

  startsWith(String searchKey) {}
}
