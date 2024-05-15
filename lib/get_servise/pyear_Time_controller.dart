// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class PrayerTimeController extends GetxController {
//   late String _timeLeft;

//   @override
//   void onInit() {
//     super.onInit();
//     startTimer();
//   }

//   String get timeLeft => _timeLeft;

//   void startTimer() {
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       var timeLeft = calculateTimeLeft();
//       _timeLeft = timeLeft;
//       update(); // Notify listeners
//     });
//   }

//   String calculateTimeLeft() {
//     DateTime now = DateTime.now();
//     DateTime nextWaqtDateTime = DateFormat('HH:mm').parse('15:00'); // Replace '15:00' with the time of the next waqt
//     Duration difference = nextWaqtDateTime.difference(now);

//     int hours = difference.inHours;
//     int minutes = difference.inMinutes.remainder(60);
//     int seconds = difference.inSeconds.remainder(60);

//     return '$hours hours $minutes minutes $seconds seconds';
//   }
// }
