import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/widgets/button.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

// ignore: camel_case_types
class _loginscreenState extends State<loginscreen> {
  final Authmethod _authmethod = Authmethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start or join a meeting",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/onboarding.jpg'),
          ),
          // ignore: void_checks
          button(
            text: 'Google Sign in',
            onpressed: () async {
              bool res = await _authmethod.googlesigninmeyhod(context);
              if (res) {
                Navigator.pushNamed(context, '/homescreen');
              }
            }, 
          ),
        ],
      ),
    );
  }
}
