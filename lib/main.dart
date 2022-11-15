import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/constants/colors.dart';
import 'package:lucky_wheels_flutter/constants/custom_values.dart';
import 'package:lucky_wheels_flutter/helper/dependencies.dart' as dep;
import 'package:lucky_wheels_flutter/pages/auth/sign_in_page.dart';
import 'package:lucky_wheels_flutter/pages/auth/sign_up_page.dart';
import 'package:lucky_wheels_flutter/pages/home/home_page.dart';
import 'package:lucky_wheels_flutter/utils/cacheHelper.dart';
import 'package:lucky_wheels_flutter/utils/wheel_timer_service.dart';
import 'constants/prefs_constants.dart';
import 'routes/route_helper.dart';
import 'translation/localization/localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  await dep.init();

  if (!CacheHelper.sharedPreferences
      .containsKey(PrefsConstants.CURRENT_TIMER)) {
    CacheHelper.sharedPreferences
        .setInt(PrefsConstants.CURRENT_TIMER, CustomValues.TIMER);
  }
  await WheelTimerService.initializeService();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // CacheHelper.saveData(key: SharedPrefsKeys.languageCode, value: 'en');

    //we put these nested GetBuilders to solve
    //the problem of calling controllers after GetMaterialApp

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: CustomValues.APP_NAME,
      // home: SplashScreen(),
      home: HomePage(),
      // initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
      locale: const Locale('en'),
      translations: AppLocalization(),
      theme: ThemeData(
        primaryColor: AppColors.mainColor,
        fontFamily: 'Lato',
      ),
    );
  }
}
