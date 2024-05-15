// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../function/getPreyerTime.dart';
import '../widgets/imageSlider.dart';

class PrayerTimeView extends StatelessWidget {
  PrayerTimeController controller = Get.put(PrayerTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3F746E),
      appBar: AppBar(
          backgroundColor: Color(0xFF3F746E),
          title: ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            title: Text("আসসালামু আলাইকুম"),
            subtitle: Text("Welcome back"),
          )),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: TextSlider(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        var name = [
                          "কুরআন",
                          'হাদিস',
                          'দু-আ',
                          "মাসিক \nজামানত",
                          'দান',
                          'যাকাত বা\nফিতরা'
                        ];
                        return Card(
                          child: Container(
                            height: 70,
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/${index}.png',
                                  height: 70,
                                  width: 70,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  name[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.purple),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 8,),
                          Text(
                            "আপনার ঠিকানে অনুযায়ী",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Divider(
                            color: Colors.purple,
                          ),
                          SizedBox(
                            height: 120,
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    var times = controller
                                        .prayerTime.value.data!.timings!;
                                    var prayertime = [
                                      times.fajr,
                                      times.dhuhr,
                                      times.asr,
                                      times.maghrib,
                                      times.asr
                                    ];
                                    var prayertimeName = [
                                      'ফজর',
                                      'যোহর',
                                      'আসর',
                                      'মাগরিব',
                                      'এশা'
                                    ];

                                    String formateTime = '';
                                    DateTime time = DateFormat.Hm()
                                        .parse(prayertime[index]!);
                                    formateTime = DateFormat.jm().format(time);
                                    return Card(
                                      color: Color(0xFF3F746E),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6.0, horizontal: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              prayertimeName[index],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            Icon(
                                              Icons.mosque_outlined,
                                              size: 50,
                                              color: Colors.white,
                                            ),
                                            //Text(prayertime[index].toString())
                                            Text(
                                              formateTime,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  // Obx(() {
            //   if (prayerTimeController.isLoading.value) {
            //     return Center(child: CircularProgressIndicator());
            //   } else {
            //     return ListView(
            //       children: [
            //         ListTile(
            //           title: Text(
            //               'Fajr: ${prayerTimeController.prayerTime.value.data!.timings!.fajr}'),
            //         ),
            //         ListTile(
            //           title: Text(
            //               'Sunrise: ${prayerTimeController.prayerTime.value.data!.timings!.sunrise}'),
            //         ),
            //         // Add more ListTile widgets for other prayer times
            //       ],
            //     );
            //   }
            // }),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     prayerTimeController.fetchPrayerTime();
            //   },
            //   child: Icon(Icons.refresh),
            // ),