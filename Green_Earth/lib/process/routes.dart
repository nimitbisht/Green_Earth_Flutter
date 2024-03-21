// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:greenearth/Screens/exporter.dart';
import 'package:greenearth/process/exporter.dart';
import 'package:greenearth/screens/HomeScreen/Profile/Settings/exporter.dart';
// Imported Files (end)

var routes = <String, WidgetBuilder> {
  // Specify all route here. (start)
 // '/' : (context) => Authentication(),
  '/' : (context) => Authentication(),
  '/home' : (context) => HomeScreen(),
  '/profile' : (context) => ProfilePage(),
  '/auth' : (context) => Authentication(),
  // '/' : (context) => ,
  // '/' : (context) => ,
  // '/' : (context) => ,
  // '/' : (context) => ,
  // '/' : (context) => ,
// Specify all route here. (end)
};