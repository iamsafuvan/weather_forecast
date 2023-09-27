import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_api/res/constant/constant.dart';

class Location {
  double? latitude;
  double? longitide;
  String apiId = apiKey;
  int? status;

  Future<void> getCurrentLocation() async {
    // bool serviceEnabled = false;

    // LocationPermission permission;
    // permission = await Geolocator.checkPermission();
    // permission = await Geolocator.requestPermission();

    try {
      // serviceEnabled = await Geolocator.isLocationServiceEnabled();
      // // if (serviceEnabled) {
      // //   return Future.error('Location services are disabled.');
      // // }

      // if (permission == LocationPermission.denied) {
      //   return Future.error('Location permissions are denied');
      // }

      // if (permission == LocationPermission.deniedForever) {
      //   return Future.error(
      //       'Location permissions are permanently denied, we cannot request permissions.');
      // }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitide = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getLocationDetails(String city) async {
    GeoCode geoCode = GeoCode();

    Coordinates coordinates = await geoCode.forwardGeocoding(address: city);
    latitude = coordinates.latitude;
    longitide = coordinates.longitude;
    print(latitude);
    print(longitide);
  }
}
