import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../constants/background_grad.dart';
import '../../constants/custom_values.dart';
import '../../constants/dimensions.dart';
import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController titleAnimationController;
  late AnimationController logoAnimationController;

  bool firstAnimationEnd = false;

  Future<void> _loadResources() async {
    //when we call Getx titleAnimationController before GetMaterialApp they generally stay in the memory
    //but here we call them after
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    titleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // ..forward();

    animation = CurvedAnimation(
      parent: titleAnimationController,
      curve: Curves.linear,
    );

    logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    logoAnimationController.forward();
    logoAnimationController.addListener(() {
      setState(() {
        if (logoAnimationController.status == AnimationStatus.completed) {
          // logoAnimationController.repeat();
          titleAnimationController.forward();
          firstAnimationEnd = true;
        }
      });
    });

    Timer(
      const Duration(seconds: 5),
      () => Get.offNamed(RouteHelper.getInitial()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: BackGroundGradient.background1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: firstAnimationEnd
            ? Center(
                child: ScaleTransition(
                  scale: animation,
                  child: Center(
                      child: Text(
                    CustomValues.APP_NAME,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.font26 * 3,
                        fontFamily: "Devonshire"),
                  )),
                ),
              )
            : Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 2.0)
                      .animate(logoAnimationController),
                  child: SizedBox(
                    height: 200.0,
                    width: 200.0,
                    child: Image.asset('assets/image/logo part 1.png'),
                  ),
                )),
      ),
    );
  }
}
