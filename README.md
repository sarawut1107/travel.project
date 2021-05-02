# SimpleToDoList

พัฒนาโดย

นายสราวุธ ศรีพรม

นางสาวกนกวรรณ สุดอนุ

นางสาวกัลยา กวดขันธ์

นางสาววราภรณ์ ทองมนต์

นายณรงค์เดช เพ็งแจ่ม

นักศึกษาสาขาวิทยาการคอมพิวเตอร์

คณะศิลปศาสตร์และวิทยาศาสตร์ มหาวิทยาลัยราชภัฏศรีสะเกษ

**Description:**

โปรแกรมท่องเที่ยววัดในจังหวัดศรีสะเกษ เป็นโปรแกรมเพื่อใช้สำหรับการค้นหาข้อมูลแหล่งท่องเที่ยววัดในจังหวัดศรีสะเกษ โดยการอ่านJson เพื่อใช้ในการแสดงผลข้อมูลที่เราค้นหา

เข้าใจในเรื่องการสร้างข้อมูลให้อยู่ในรูปแบบโครงสร้างของ Json และการอ่าน ไฟล์ในโมบายแอปพลิเคชั่น

โมบายแอปพลิเคชั่นนี้พัฒนาขึ้นเพื่อใช้เป็นตัวอย่างในกรณีศึกษาการพัฒนาโมบายแอปพลิเคชั่นด้วย Flutter ในรายวิชาการพัฒนาแอปพลิเคชั่นบนมือถือ เพื่อให้ได้ใช้สำหรับการศึกษา ทดลองปฏิบัติตาม ให้เกิดความรู้ ความเข้าใจ และทักษะในการพัฒนาโปรแกรมบนมือถือด้วย Flutter

โปรแกรมท่องเที่ยววัดในจังหวัดศรีสะเกษ ประกอบด้วย 6 หน้า ได้แก่

1.หน้า WElCOME TO TRAVEL TEMPLEL SISAKET

2.หน้า LOGIN

3.หน้า SIGN UP

4.หน้ารายชื่อวัด

5.หน้าข้อมูล

6.หน้าGoogle Map

Application Travel Templel Sisaket ใช้การบันทึก - อ่านข้อมูลแบบ JSON เพื่อบันทึกข้อมูลต่างๆ ที่ทำเอาไว้

## การอ่านไฟล์Json การสร้าง Search Bar และการสร้างGridView

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
\_TravelViewPageState createState() => \_TravelViewPageState();
}

class \_TravelViewPageState extends State<TravelViewPage> {
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
                latitude: widget.latitude,
                longtide: widget.longitude,
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
