import 'package:e_commerce/application/core/const/const_values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/constants/text_style.dart';

int notificationCount = 1;

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
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 15.sp,
              child: Text(
                notificationCount.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
        title: Text('Notifications',
            style: TextStyles.heading2.copyWith(fontSize: 3.sh)),
      ),
      body: Column(
        children: [
          SizedBox(height: 1.sh),
          const Expanded(
              child: BuildNotificationBox(
            day: 'Today',
            massage: 'Hi, Massage for fitMore',
          )),
        ],
      ),
    );
  }
}

class BuildNotificationBox extends StatelessWidget {
  final String day;
  final String massage;
  const BuildNotificationBox({
    super.key,
    required this.day,
    required this.massage,
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
            Expanded(
                child: ListView.builder(
              itemCount: notificationtext.length,
              itemBuilder: (context, index) =>
                  NotificaitonCard(massage: notificationtext[index]),
            ))
          ],
        ));
  }
}

class NotificaitonCard extends StatelessWidget {
  final String massage;
  const NotificaitonCard({
    super.key,
    required this.massage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.sp,
        child: Image.asset(
          'asset/play_store_512.png',
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        massage,
        style: TextStyles.bodyText2
            .copyWith(color: Colors.black, fontSize: 1.8.sh),
      ),
      subtitle: Text('10m ago',
          style: TextStyles.bodyText2.copyWith(fontSize: 1.5.sh)),
    );
  }
}
