// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:greenearth/process/routes.dart';
import 'package:greenearth/screens/HomeScreen/Profile/Settings/exporter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
// Imported Files (end)

// runApp() in void main initialize the App
Future<void> main() async {

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));

  //  Specify the things you want to initialize before your App (start)
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //  Specify the things you want to initialize before your App (end)
  runApp(ChangeNotifierProvider<ThemeState>(
    create: (context) => ThemeState(),
    child: const GreenEarth(),
  ));
}

// Top parent class (GreenEarth).
class GreenEarth extends StatelessWidget {
  const GreenEarth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // This function called before material app to get weather_aqi info.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeState>(context).theme == ThemeType.DARK
          ? ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1:
          TextStyle(fontSize: 44.0, fontWeight: FontWeight.bold,color: Colors.white, fontFamily: 'Quicksand',),
          headline2:
          TextStyle(fontSize: 16.0,),
          bodyText2: TextStyle(fontSize: 10.0,),

        ),
      )
          : ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightGreen[300],
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1:
          TextStyle(fontSize: 44.0, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),
          headline2:
          TextStyle(fontSize: 16.0,),
          bodyText2: TextStyle(fontSize: 10.0,),
        ),
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}
