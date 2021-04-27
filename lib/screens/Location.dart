import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyLocation extends StatefulWidget {
  MyLocation({Key key}) : super(key: key);

  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {

  Location location = Location();
  LocationData _currentLocation;
  Completer<GoogleMapController> _controller = Completer();
  LatLng _initialCameraPosition;

  @override
  void initState() { 
    super.initState();
    
    getLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  getLocation() async {
    _currentLocation = await location.getLocation();
    _initialCameraPosition = LatLng(_currentLocation.latitude, _currentLocation.longitude);
  }

  Widget gmaps() {
    return Container(
      alignment: Alignment.bottomRight ,
      height: 500,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _initialCameraPosition, zoom: 15),
        mapType: MapType.hybrid,
        myLocationEnabled: true,
      ),
    );
  }

  Widget latLongText() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(100),
      child: Text(
              'Latitud: ' + _currentLocation.latitude.toString() + ' Longitud: ' + _currentLocation.longitude.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          gmaps(),
          latLongText(),
        ],
      ),
    );
  }
}