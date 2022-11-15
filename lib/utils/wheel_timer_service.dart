import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lucky_wheels_flutter/constants/custom_values.dart';
import 'package:lucky_wheels_flutter/constants/prefs_constants.dart';
import 'package:lucky_wheels_flutter/utils/duration_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

class WheelTimerService {
  // static TimerController timerController = Get.find<TimerController>();
  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    /// OPTIONAL, using custom notification channel id
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'my_foreground', // id
      'MY FOREGROUND SERVICE', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.low, // importance must be at low or higher level
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // if (Platform.isIOS) {
    //   await flutterLocalNotificationsPlugin.initialize(
    //     const InitializationSettings(
    //       iOS: IOSInitializationSettings(),
    //     ),
    //   );
    // }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: _onStart,

        // auto start service
        autoStart: false,
        isForegroundMode: true,
        autoStartOnBoot: false,

        notificationChannelId: 'my_foreground',
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        // auto start service
        autoStart: true,
        // this will be executed when app is in foreground in separated isolate
        onForeground: _onStart,
        // you have to enable background fetch capability on xcode project
        onBackground: _onIosBackground,
      ),
    );

    // service.startService();
  }

  @pragma('vm:entry-point')
  static Future<bool> _onIosBackground(ServiceInstance service) async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    // final log = preferences.getStringList('log') ?? <String>[];
    // log.add(DateTime.now().toIso8601String());
    // await preferences.setStringList('log', log);
    return true;
  }

  @pragma('vm:entry-point')
  static void _onStart(ServiceInstance service) async {
    // Only available for flutter 3.0.0 and later
    DartPluginRegistrant.ensureInitialized();

    // For flutter prior to version 3.0.0
    // We have to register the plugin manually

    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? timerCurrentValue = preferences.getInt(PrefsConstants.CURRENT_TIMER);
    preferences.setBool(PrefsConstants.TIMER_ON, true);
    Duration duration = Duration(seconds: timerCurrentValue!);

    if (timerCurrentValue == 0) {
      preferences.setInt(PrefsConstants.CURRENT_TIMER, CustomValues.TIMER);
      timerCurrentValue = CustomValues.TIMER;
    }

    /// OPTIONAL when use custom notification
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          /// OPTIONAL for use custom notification
          /// the notification id must be equals with AndroidConfiguration when you call configure() method.
          ///
          timerCurrentValue = preferences.getInt(PrefsConstants.CURRENT_TIMER);
          duration = Duration(seconds: timerCurrentValue!);
          if (timerCurrentValue! > 0) {
            preferences.setInt(
                PrefsConstants.CURRENT_TIMER, timerCurrentValue! - 1);
          }

          // flutterLocalNotificationsPlugin.show(
          //   888,
          //   CustomValues.APP_NAME,
          //   'Awesome ${DurationFormatter.durationToTime(duration)} ',
          //   const NotificationDetails(
          //     android: AndroidNotificationDetails(
          //       'my_foreground',
          //       'MY FOREGROUND SERVICE',
          //       icon: 'ic_bg_service_small',
          //       ongoing: false,
          //       usesChronometer: true,
          //     ),
          //   ),
          // );

          // if you don't using custom notification, uncomment this
          service.setForegroundNotificationInfo(
            title: CustomValues.APP_NAME,
            content: DurationFormatter.durationToTime(duration),
          );
        }
      }

      /// you can see this log in logcat
      print('FLUTTER BACKGROUND SERVICE: ${timerCurrentValue}');

      // service.invoke(
      //   'update',
      //   {
      //     "current_date": DateTime.now().toIso8601String(),
      //     "device": device,
      //   },
      // );
      service.invoke(
        'update',
        {
          "current_time": timerCurrentValue,
        },
      );

      if (timerCurrentValue! == 0) {
        service.invoke(
          'update',
          {
            "current_date": CustomValues.TIMER,
          },
        );
        preferences.setBool(PrefsConstants.TIMER_ON, false);
        service.stopSelf();
      }
    });
  }
}
