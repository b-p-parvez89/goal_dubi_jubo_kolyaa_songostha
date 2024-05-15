import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:goal_dubi_jubo_kolyaa_songostha/screren/quran/alQuranmodel.dart';

class SurahDetailPage extends StatelessWidget {
  final AlQuranModel surah;

  SurahDetailPage({required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah ${surah.name}'),
      ),
      body: ListView.builder(
        itemCount: surah.verses?.length ?? 0,
        itemBuilder: (context, index) {
          final verse = surah.verses![index];
          return Card(
              // child: ListTile(
              //   title: Text('Verse ${verse.id}'),
              //   subtitle: Text(verse.text ?? ''),
              // ),

              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${verse.text}",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 28.sp),
              ),
              SizedBox(
                height: 8,
              ),
              Text("${verse.id} ${verse.translation}")
            ],
          ));
        },
      ),
    );
  }
}
