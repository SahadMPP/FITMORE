import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/constants/text_style.dart';

class ListOfNotification extends StatelessWidget {
  const ListOfNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.sw),
            child: const Icon(Icons.more_vert, color: Colors.black),
          )
        ],
        title: Text('Notifications', style: TextStyles.heading2),
      ),
      body: ListView(
        children: [
          SizedBox(height: 1.sh),
          const BuildNotificationBox(day: 'Today'),
          SizedBox(height: 1.sh),
          const BuildNotificationBox(day: 'Yesterday'),
        ],
      ),
    );
  }
}

class BuildNotificationBox extends StatelessWidget {
  final String day;
  const BuildNotificationBox({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: .5.sh),
            Padding(
              padding: EdgeInsets.only(left: 5.sw),
              child: Text(day,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, color: Colors.grey)),
            ),
            Divider(color: Colors.grey[300]),
            Column(
              children: [
                ListTile(
                  leading: CircleAvatar(radius: 20.sp),
                  title: Text(
                    'Your recent transation of 10.50 at here and there I hope you understand',
                    style: TextStyles.bodyText2.copyWith(color: Colors.black,fontSize: 1.8.sh),
                  ),
                  subtitle: Text('10m ago', style: TextStyles.bodyText2.copyWith(fontSize: 1.5.sh)),
                ),
                 ListTile(
                  leading: CircleAvatar(radius: 20.sp),
                  title: Text(
                    'Your recent transation of 10.50 at here and there I hope you understand',
                    style: TextStyles.bodyText2.copyWith(color: Colors.black,fontSize: 1.8.sh),
                  ),
                  subtitle: Text('10m ago', style: TextStyles.bodyText2.copyWith(fontSize: 1.5.sh)),
                ),
                 ListTile(
                  leading: CircleAvatar(radius: 20.sp),
                  title: Text(
                    'Your recent transation of 10.50 at here and there I hope you understand',
                    style: TextStyles.bodyText2.copyWith(color: Colors.black,fontSize: 1.8.sh),
                  ),
                  subtitle: Text('10m ago', style: TextStyles.bodyText2.copyWith(fontSize: 1.5.sh)),
                ),
              ],
            ),
          ],
        ));
  }
}
