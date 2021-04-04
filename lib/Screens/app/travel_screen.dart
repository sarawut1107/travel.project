import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import '../Login/components/background.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  var jsonData;
  Future<String> _GetTravelAPI() async {
    var response =
        await Http.get('http://sarawut1107.github.io/templel/templel.json');

    jsonData = json.decode(utf8.decode(response.bodyBytes));

    return 'ok';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Sisaket'),
      ),
      body: Background(
        child: ListView(
          children: <Widget>[
            Card(
              child: Image.network(
                  'https://s.isanook.com/ns/0/rp/r/w728/ya0xa0m1w0/aHR0cHM6Ly9zLmlzYW5vb2suY29tL25zLzAvdWQvMTY3Mi84MzYwNDQ2L2NvdmVyLmpwZw==.jpg'),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              margin: EdgeInsets.all(15),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Align(
                child: Text(
                  '"พลอย ชิดจันทร์" ออกโรงขอโทษ โดนร้องทุกข์เปิดคาเฟ่ สร้างความเดือดร้อนให้ชุมชน',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Align(
                child: Text(
                    'เป็นประเด็นที่นักแสดงสาว พลอย ชิดจันทร์ ต้องออกมาเคลียร์ด่วนๆ หลังมีผู้ออกมาโพสต์โซเชียลร้องทุกข์ เรื่องที่คาเฟ่ที่ จ.เชียงใหม่ ของสาวพลอยและหุ้นส่วนที่เปิดในย่านชุมชนสร้างความเดือดร้อนให้คนในพื้นที่ เนื่องจากที่ร้านไม่มีที่จอดรถสำหรับลูกค้า ทำให้ลูกค้านำรถมาจอดขวางหน้าบ้าน จนกลายเป็นกระแสวิพากษ์วิจารณ์ขึ้นมามากมาย '),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
