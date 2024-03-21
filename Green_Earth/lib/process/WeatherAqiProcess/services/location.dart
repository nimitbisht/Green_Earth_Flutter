import 'package:geolocator/geolocator.dart';
import 'package:greenearth/process/exporter.dart';

class Location {
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      longitude = position.longitude;
      latitude = position.latitude;
      lat = latitude;
      lng = longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
