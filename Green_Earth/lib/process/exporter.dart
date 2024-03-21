// Export all page files from here (start)
// ignore_for_file: prefer_typing_uninitialized_variables

export 'package:greenearth/process/LoginProcess/google_sign_in.dart';
export 'package:greenearth/process/WeatherAqiProcess/weather_pre_process.dart';
export 'package:greenearth/process/WeatherAqiProcess/screens/city_screen.dart';
export 'package:greenearth/process/WeatherAqiProcess/screens/loading_screen.dart';
export 'package:greenearth/process/WeatherAqiProcess/screens/location_screen.dart';
export 'package:greenearth/process/WeatherAqiProcess/services/location.dart';
export 'package:greenearth/process/WeatherAqiProcess/services/networking.dart';
export 'package:greenearth/process/WeatherAqiProcess/services/weather.dart';
// Export all page files from here (end)

// imported Files (start)
import 'package:google_sign_in/google_sign_in.dart';
// imported Files (end)


// Global Variables of Process (start)
final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: [
    'email'
  ],
);


var lat;
var lng;
var userName;
var userPhoto;
var userEmail;
GoogleSignInAccount? currentUser;
// Global Variables of Process (end)
