import 'package:eko_jitsi/eko_jitsi.dart';
import 'package:flutter/material.dart';

import 'package:zoom_clone/constant/colors.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/resources/newmeeting.dart';
import 'package:zoom_clone/widgets/meetingoption.dart';

class videocallScreen extends StatefulWidget {
  const videocallScreen({super.key});

  @override
  State<videocallScreen> createState() => _videocallScreenState();
}

class _videocallScreenState extends State<videocallScreen> {
  final jitsiMeetMethods _jitsimeet = jitsiMeetMethods();
  final Authmethod authmethod = Authmethod();
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  bool isAuiomute = true;
  bool isvideomute = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController(text: authmethod.user.displayName);
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    EkoJitsi.removeAllListeners();
  }

  _joinmeeting() {
    _jitsimeet.createnewmeeting(
        name: _controller2.text,
        roomname: _controller1.text,
        isaudio: isAuiomute,
        isvideo: isvideomute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join a meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: _controller1,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: secondaryBackgroundColor,
                  hintText: 'Room ID',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: _controller2,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: secondaryBackgroundColor,
                  hintText: 'Name',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinmeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Join',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          meetingoption(
            text: 'Mute audio',
            ismute: isAuiomute,
            onChanged: isAudiomuted,
          ),
          meetingoption(
            text: 'Turn off my video',
            ismute: isvideomute,
            onChanged: isvideomuted,
          ),
        ],
      ),
    );
  }

  isAudiomuted(bool? val) {
    setState(() {
      isAuiomute = val!;
    });
  }

  isvideomuted(bool? val) {
    setState(() {
      isvideomute = val!;
    });
  }
}
