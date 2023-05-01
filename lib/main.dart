import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/constant/colors.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/screen/homescreen.dart';
import 'package:zoom_clone/screen/loginscreen.dart';
import 'package:zoom_clone/screen/splash1.dart';
import 'package:zoom_clone/screen/splash2.dart';
import 'package:zoom_clone/screen/videocallscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      routes: {
   
        '/login': (context) => const loginscreen(),
        '/homescreen': (context) => const homescreen(),
        '/videocall':(context) => const videocallScreen(),
      },
      home: StreamBuilder(
        stream: Authmethod().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const splash2();
          } else {
            return const splash1();
          }
        },
      ),
    );
  }
}
