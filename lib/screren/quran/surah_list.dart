import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goal_dubi_jubo_kolyaa_songostha/screren/quran/ayat.dart';

import '../../function/get_quranData.dart';

class SurahList extends StatelessWidget {
  final QuranController quranController =
      Get.put(QuranController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quran Data')),
      body: Obx(
        () => quranController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: quranController.quranData.length,
                itemBuilder: (context, index) {
                  final surah = quranController.quranData[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                       
                        Get.to(() => SurahDetailPage(surah: surah));
                      },
                      leading: Text("${surah.id}"),
                      title: Text('Surah ${surah.name}'),
                      subtitle: Text(surah.translation ?? ''),
                      trailing: Text("আয়াতঃ${surah.totalVerses}"),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
