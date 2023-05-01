import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/newmeeting.dart';

import '../widgets/meetingBuutton.dart';

class meetingscreen extends StatelessWidget {
  meetingscreen({super.key});
  final jitsiMeetMethods _meetMethods = jitsiMeetMethods();
  createmeeting() async {
    var randam = Random();
    String roomname = (randam.nextInt(1000000) + 1000000).toString();
    _meetMethods.createnewmeeting(
        roomname: roomname, isaudio: true, isvideo: true);
  }

  joinmeeting(BuildContext context) {
    Navigator.pushNamed(context, '/videocall');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              meetingButton(
                onPressed: createmeeting,
                text: 'New Meeting',
                icon: Icons.videocam,
              ),
              meetingButton(
                onPressed: () =>joinmeeting(context),
                text: 'Join Meeting',
                icon: Icons.add_box_rounded,
              ),
              meetingButton(
                onPressed: () {},
                text: 'Schedule Meeting',
                icon: Icons.calendar_today,
              ),
              meetingButton(
                onPressed: () {},
                text: 'Share Screen',
                icon: Icons.arrow_upward_rounded,
              ),
            ],
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join a Meeting with Just a Click',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
