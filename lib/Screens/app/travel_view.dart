import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'map.dart';

class TravelViewPage extends StatefulWidget {
  final String name;
  final String maestro;
  final String detail;
  final String img;

  TravelViewPage({
    Key key,
    @required this.name,
    this.maestro,
    this.detail,
    @required this.img,
  }) : super(key: key);
  @override
  _TravelViewPageState createState() => _TravelViewPageState();
}

class _TravelViewPageState extends State<TravelViewPage> {
  @override
  Widget build(BuildContext context) {
    @override
    // ignore: unused_element
    void initState() {
      super.initState();
      if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    }

    print(widget.img);

    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Data'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                child: Align(
                  child: Text("${widget.name}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                child: Image.network('${widget.img}'),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                margin: EdgeInsets.all(15),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Align(
                  child: Text(
                    "${widget.maestro}",
                    style: TextStyle(fontSize: 20, color: Colors.grey[800]),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  child: Text(
                    "${widget.detail}",
                    style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MapPage()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.near_me),
      ),
    );
  }
}
