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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/app/travel_view.dart';
import 'package:http/http.dart' as Http;
import '../Login/components/background.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

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
\_TravelPageState createState() => \_TravelPageState();
}

class \_TravelPageState extends State<TravelPage> {
var jsonData;
SearchBar searchBar;
String searchKey = "";

// ! List for store temple data from JSON
List<TempleData> templeList = [];

// ! Create new list for show
List<TempleData> templeListShow = [];

// ignore: unused_field
final GlobalKey<ScaffoldState> \_scaffoldKey = new GlobalKey<ScaffoldState>();

AppBar buildAppBar(BuildContext context) {
return new AppBar(
title: new Text(
'รายชื่อวัดในจังหวัดศรีสะเกษ',
style: GoogleFonts.baiJamjuree(),
),
actions: [searchBar.getSearchAction(context)],
);
}

void onSubmitted(String value) {
setState(() {
searchKey = value;
\_scaffoldKey.currentState.showSnackBar(
new SnackBar(content: new Text('You search for $value!')));
});
}

\_TravelPageState() {
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
Future<String> \_getTravelAPI() async {
var response =
await Http.get('https://sarawut1107.github.io/templel/templel.json');

    jsonData = json.decode(utf8.decode(response.bodyBytes));
    // ! if refresh screen
    templeList.clear();
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

    // ! for filter temple when have keyword.
    if (searchKey == "") {
      templeListShow = templeList;
    } else {
      print(searchKey);
      templeListShow = templeList
          .where((element) => element.name.startsWith(searchKey))
          .toList();
    }

    return 'jsonData';

}

@override
Widget build(BuildContext context) {
// ignore: unused_local_variable
TextStyle bulletStyle = GoogleFonts.baiJamjuree(
fontSize: 20,
);
return new Scaffold(
appBar: searchBar.build(context),
key: \_scaffoldKey,
body: Background(
child: FutureBuilder(
future: \_getTravelAPI(),
builder: (context, snapshot) {
if (snapshot.hasData) {
return GridView.builder(
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
childAspectRatio: 8 / 8,
crossAxisSpacing: 8,
mainAxisSpacing: 8,
),
itemCount: templeListShow.length,
itemBuilder: (BuildContext context, index) {
return Container(
height: 200,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.all(
Radius.circular(
20,
),
)),
child: InkWell(
onTap: () {
// ! Use templeListShow to display temple data
Navigator.push(
context,
MaterialPageRoute(
// ignore: missing_required_param
builder: (context) => TravelViewPage(
name: templeListShow[index].name,
maestro: templeListShow[index].maestro,
detail: templeListShow[index].detail,
img: templeListShow[index].img,
latitude: templeListShow[index].latitude,
longitude: templeListShow[index].longitude,
),
),
);
},
child: Column(
children: [
Container(
padding: EdgeInsets.all(10.0),
decoration: ShapeDecoration(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.vertical(
top: Radius.circular(200),
),
),
),
child: Image.network(
"${templeListShow[index].img}",
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                alignment: FractionalOffset.center,
                                width: double.infinity,
                                child: Text(
                                  "${templeListShow[index].name}",
style: bulletStyle,
),
)
],
)
],
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

## การอ่าน ไฟล์Json
