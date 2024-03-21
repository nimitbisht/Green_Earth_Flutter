// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_maps/admin.dart';
import 'package:firebase_core/firebase_core.dart';

var imageUrl;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GreenEarthAdmin());
}

class GreenEarthAdmin extends StatelessWidget {
  const GreenEarthAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Admin(), debugShowCheckedModeBanner: false,);
  }
}
