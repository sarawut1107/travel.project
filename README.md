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

**Packages we are using:**

- fluuter: [link](https://pub.dev/packages/flutter_svg)

- http: [link](https://pub.dev/packages/http)

- geolocator: [link](https://pub.dev/packages/geolocator)

- google_maps_flutter: [link](https://pub.dev/packages/google_maps_flutter)

- flutter_search_Bar: [link](https://pub.dev/packages/flutter_search_bar)

- google_fonts: [link](https://pub.dev/packages/google_fonts)

## การอ่านไฟล์Json

    class TravelPageState extends State<TravelPage> {
    var jsonData;
    List<TempleData> templeList = [];
    Future<String> getTravelAPI() async {
    var response = await Http.get('https://sarawut1107.github.io/templel/templel.json');

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
        child: FutureBuilder(
          future: _getTravelAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                itemCount: templeListShow.length,
                    child: InkWell(
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
    }

## ตัวอย่างหน้าจอ

![img](./img.jpg)
