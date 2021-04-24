import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/app/travel_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'map.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelViewPage extends StatefulWidget {
  List<TempleData> templeListShow = [];
  List<TempleData> templeList = [];

  final String name;
  final String maestro;
  final String detail;
  final String img;
  final double latitude;
  final double longitude;

  TravelViewPage({
    Key key,
    @required this.name,
    this.maestro,
    this.detail,
    @required this.img,
    this.latitude,
    this.longitude,
  }) : super(key: key);
  @override
  _TravelViewPageState createState() => _TravelViewPageState();
}

class _TravelViewPageState extends State<TravelViewPage> {
  List<TempleData> templeList = [];
  TextStyle bulletStyle = GoogleFonts.baiJamjuree(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  TextStyle contentStyle = GoogleFonts.baiJamjuree(
    fontSize: 22,
  );

  TextStyle kobfont = GoogleFonts.baiJamjuree(
    fontSize: 20,
  );

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
        title: Text(
          'รายละเอียดวัด',
          style: GoogleFonts.baiJamjuree(),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Align(
                  child: Text(
                    "${widget.name}",
                    style: bulletStyle,
                  ),
                ),
              ),
              Card(
                child: Image.network('${widget.img}'),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                margin: EdgeInsets.all(15),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Align(
                  child: Text(
                    "${widget.maestro}",
                    style: contentStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  child: Text("${widget.detail}", style: kobfont),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: missing_required_param
              builder: (context) => MapPage(
                name: '${widget.name}',
                latitude: '${widget.latitude}',
                longtide: '${widget.longitude}',
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.near_me,
        ),
      ),
    );
  }
}
