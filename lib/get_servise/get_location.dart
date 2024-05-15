import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class GetLocation {
  String? districtName;
  String? country;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      await getLocation(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  Future<void> getLocation(double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse(
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        dynamic addressData = data['address'] != null
            ? data['address']
            : data['address_components'];

        if (addressData is List) {
          for (var component in addressData) {
            if (component['type'] == 'city' ||
                component['type'] == 'state_district') {
              districtName = component['name'];
              country = component["country"];
              break;
            }
          }
        } else if (addressData is Map) {
          if (addressData['city'] != null ||
              addressData['state_district'] != null) {
            districtName = addressData['city'] ?? addressData['state_district'];
            country = addressData['country'] ?? addressData['country_code'];
          }
        }
      } else {
        print('Failed to load location data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }
}
