import 'package:flutter/material.dart';
import 'package:maps_location/screens/Location.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps and Location app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps and Location app'),
        ),
        body: MyLocation()
      ),
    );
  }
}