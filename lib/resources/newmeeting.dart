import 'dart:io';
import 'package:eko_jitsi/eko_jitsi.dart';
import 'package:eko_jitsi/eko_jitsi_listener.dart';
import 'package:eko_jitsi/feature_flag/feature_flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/resources/firesoresavemeeting.dart';

class jitsiMeetMethods {
  final Authmethod authmethod = Authmethod();
  final FirestoreMethodes _firestoreMethodes = FirestoreMethodes();
  void createnewmeeting(
      {required String roomname,
      String name = "",
      required bool isaudio,
      required bool isvideo}) async {
    try {
      // Enable or disable any feature flag here
      // If feature flag are not provided, default values will be used
      // Full list of feature flags (and defaults) available in the README
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };

      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }

      // Define meetings options here
      String username;
      if (name.isEmpty) {
        username = authmethod.user.displayName!;
      } else {
        username = name;
      }
      var options = JitsiMeetingOptions()
        ..room = roomname
        // ..room = roomText.text
        //..serverURL = serverUrl
        // ..subject = subjectText.text
        ..userDisplayName = name
        ..userEmail = authmethod.user.email
        //  ..audioOnly = isAudioOnly
        ..audioMuted = isaudio
        ..videoMuted = isvideo
        ..featureFlags.addAll(featureFlags);
      _firestoreMethodes.addtomeeting(roomname);

      debugPrint("JitsiMeetingOptions: $options");
      await EkoJitsi.joinMeeting(
        options,
        listener: EkoJitsiListener(onConferenceWillJoin: ({message}) {
          debugPrint("${options.room} will join with message: $message");
        }, onConferenceJoined: ({message}) {
          debugPrint("${options.room} joined with message: $message");
        }, onConferenceTerminated: ({message}) {
          debugPrint("${options.room} terminated with message: $message");
        }),
        // by default, plugin default constraints are used
        //roomNameConstraints: new Map(), // to disable all constraints
        //roomNameConstraints: customContraints, // to use your own constraint(s)
      );
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
