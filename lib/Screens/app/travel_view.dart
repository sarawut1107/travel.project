import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'travel_screen.dart';

class TravelViewPage extends StatefulWidget {
  final String name;
  TravelViewPage({Key key, @required this.name}) : super(key: key);
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
        body: FutureBuilder());
  }
}
