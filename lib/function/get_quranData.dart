import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../screren/quran/alQuranmodel.dart';


class QuranController extends GetxController {
  var quranData = <AlQuranModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/quran_bn.json'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        quranData.value = jsonResponse.map((data) => AlQuranModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load data from API');
      }
    } finally {
      isLoading(false);
    }
  }
}







// import 'package:get/get.dart'; // Import GetX package
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../screren/quran/alQuranmodel.dart';

// class QuranController extends GetxController {
//   var isLoading = true.obs;
//   var quranData = AlQuranModel().obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchQuranData();
//   }
// void fetchQuranData() async {
//   try {
//     isLoading(true); // Set isLoading to true before fetching data

//     // Fetch data from your API endpoint
//     final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
    
//     if (response.statusCode == 200) {
//       // Parse the JSON response
//       final List<dynamic> dataList = json.decode(response.body);
//       // Map each item in the list to an AlQuranModel object
//       List<AlQuranModel> quranList = dataList.map((data) => AlQuranModel.fromJson(data)).toList();
//       // Update the quranData value with the list of Quran data
//       quranData.value = quranList as AlQuranModel;
//     } else {
//       print('Failed to load Quran data: ${response.statusCode}');
//       // Handle other HTTP status codes here
//     }
//   } catch (e) {
//     print('Error loading Quran data: $e');
//     // Handle other types of errors here
//   } finally {
//     isLoading(false); // Set isLoading to false after fetching data
//   }
// }


// }
