import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_auth/Screens/app/travel_screen.dart';

class MapPage extends StatefulWidget {
  List<TempleData> templeListShow = [];
  List<TempleData> templeList = [];

  final String name;
  final latitude;
  final longtide;

  MapPage({
    Key key,
    this.name,
    @required this.latitude,
    @required this.longtide,
  }) : super(key: key);

  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<TempleData> templeList = [];
  Position userLocation;
  GoogleMapController mapController;

  // ! ให้นำเอาพิกัด latitude & longitude มาใส่ตรงนี้
  LatLng position = LatLng(15.191689, 104.2772274);

  //Set google maps marker;
  Map<String, Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> _getlocation() async {
    try {
      userLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      userLocation = null;
    }
    return userLocation;
  }

  @override
  Widget build(BuildContext context) {
    // ! Set Google Maps Marker
    final marker = new Marker(
      markerId: MarkerId('Hello'),
      position: position,
      infoWindow: InfoWindow(
        title: '${widget.name}',
        // snippet: history.date,
      ),
    );
    _markers["0"] = marker;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แผนที่',
          style: GoogleFonts.baiJamjuree(),
        ),
      ),
      body: FutureBuilder(
        future: _getlocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(target: position, zoom: 15),
              markers: _markers.values.toSet(),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[CircularProgressIndicator()],
              ),
            );
          }
        },
      ),
    );
  }
}
