import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zoom_clone/screen/loginscreen.dart';

import '../constant/colors.dart';

class splash1 extends StatefulWidget {
  const splash1({super.key});

  @override
  State<splash1> createState() => _splash1State();
}

// ignore: camel_case_types
class _splash1State extends State<splash1> {
@override
  void initState() {
    
    super.initState();
    Timer(const Duration(seconds: 3),() =>Navigator.of(context).
    pushReplacement(MaterialPageRoute(builder: (context)=>const loginscreen())));
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
