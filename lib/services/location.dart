import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_api/res/constant/constant.dart';

class Location {
  double? latitude;
  double? longitide;
  String apiId = apiKey;
  int? status;

  Future<void> getCurrentLocation() async {
    try {
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
