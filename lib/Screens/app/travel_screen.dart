import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/app/travel_view.dart';
import 'package:http/http.dart' as Http;
import '../Login/components/background.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  var jsonData;
  List<TempleData> templeList = [];

  // ignore: non_constant_identifier_names
  Future<String> _getTravelAPI() async {
    var response =
        await Http.get('http://sarawut1107.github.io/templel/templel.json');

    jsonData = json.decode(utf8.decode(response.bodyBytes));
    for (var item in jsonData) {
      TempleData templeData = TempleData(item['order'], item['name'],
          item['maestro'], item['latitude'], item['longitude']);
      templeList.add(templeData);
    }
    return 'ok';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Sisaket'),
      ),
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
                                builder: (context) => TravelViewPage()));
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
  double latitude;
  double longitude;
  TempleData(
      this.order, this.name, this.maestro, this.latitude, this.longitude);
}
