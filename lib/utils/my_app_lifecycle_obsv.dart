import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

// ignore: slash_for_doc_comments
/**
 * deattached - destroyed 
 * inactive — The application is in an inactive state and is not receiving user input.
   This event only works on iOS, as there is no equivalent event to map to on Android
*paused — The application is not currently visible to the user,
 not responding to user input, and running in the background.
  This is equivalent to onPause() in Android
*resumed — The application is visible and responding to user input. This is equivalent to onPostResume() in Android
suspending — The application is suspended momentarily. This is equivalent to onStop in Android;
 */

class MyAppLifeCycleObserver with WidgetsBindingObserver {
  AppLifecycleState? _state;

  AppLifecycleState? get state => _state;

  MyAppLifeCycleObserver() {
    WidgetsBinding.instance.addObserver(this);
  }

  /// make sure the clients of this library invoke the dispose method
  /// so that the observer can be unregistered
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _state = state;

    // if (state == AppLifecycleState.inactive ||
    //     state == AppLifecycleState.paused) {
    //   FlutterBackgroundService().invoke("setAsBackground");
    // }

    if (state == AppLifecycleState.resumed) {
      FlutterBackgroundService().invoke("setAsForeground");
    }

    if (state == AppLifecycleState.detached) {
      final service = FlutterBackgroundService();

      service.invoke("stopService");
    }
    final isBackground = state == AppLifecycleState.paused;

    if (isBackground) {}

    /* if (isBackground) {
      // service.stop();
    } else {
      // service.start();
    }*/
  }

  void someFunctionality() {
    // your library feature
  }
}
