import 'package:flutter/material.dart';
import 'package:zoom_clone/constant/colors.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/screen/meetscreen.dart';
import 'package:zoom_clone/screen/previousmeeting.dart';

import '../widgets/button.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  // final Authmethod authmethod=Authmethod();
  int _page = 0;
  onpagechange(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    meetingscreen(),
    const previousmeeting(),
    const Text('Contacts'),
    button(text: 'Log Out', onpressed: () => Authmethod().signout()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meet & Chat"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onpagechange,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meetings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings'),
            //  BottomNavigationBarItem(
            //    icon: Icon(Icons.comment_bank), label: 'meet'),
          ]),
    );
  }
}
