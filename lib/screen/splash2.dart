import 'dart:async';

import 'package:flutter/material.dart';

import 'package:zoom_clone/screen/homescreen.dart';


import '../constant/colors.dart';

class splash2 extends StatefulWidget {
  const splash2({super.key});

  @override
  State<splash2> createState() => _splash2State();
}

class _splash2State extends State<splash2> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),() =>Navigator.of(context).
    pushReplacement(MaterialPageRoute(builder: (context)=>const homescreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color:buttonColor ,
        child:const Center(child: Text('ZUMY',style: TextStyle(
          fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),)),
      ),
    );
  }
}
