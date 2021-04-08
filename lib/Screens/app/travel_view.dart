import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'travel_screen.dart';

class TravelViewPage extends StatefulWidget {
  final String name;
  final String maestro;
  final String detail;
  TravelViewPage({
    Key key,
    @required this.name,
    this.maestro,
    this.detail,
  }) : super(key: key);
  @override
  _TravelViewPageState createState() => _TravelViewPageState();
}

class _TravelViewPageState extends State<TravelViewPage> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    }

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
                  child: Text("${widget.name} "),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Align(
                  child: Text("${widget.maestro} "),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  child: Text("${widget.detail} "),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
