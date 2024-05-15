import 'package:get/get.dart';
import 'package:goal_dubi_jubo_kolyaa_songostha/get_servise/get_location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/prayer_time_model.dart';

class PrayerTimeController extends GetxController {
  var prayerTime = PrayerTimeModel().obs;
  var isLoading = true.obs;

  
  String? districtName;
  String? country;

  @override
  void onInit() {
    super.onInit();
    fetchPrayerTime();
  }
Future<void> fetchPrayerTime() async {
  try {
    isLoading(true);

    // Get the user's current location
    GetLocation getLocationInstance = GetLocation();
    await getLocationInstance.getCurrentLocation();

    // Retrieve district name and country
    districtName = getLocationInstance.districtName;
    country = getLocationInstance.country;

    if (districtName != null && country != null) {
      // Construct the API request URL with the location details
      var response = await http.get(Uri.parse(
          'http://api.aladhan.com/v1/timingsByAddress?address=$districtName, $country'));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        prayerTime.value = PrayerTimeModel.fromJson(jsonResponse);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        // Handle error response accordingly
      }
    } else {
      print('District name or country is null.');
      // Handle situation when location details are null
    }
  } catch (error) {
    print('Error: $error');
    // Handle any other errors that might occur
  } finally {
    isLoading(false);
  }
}

}
