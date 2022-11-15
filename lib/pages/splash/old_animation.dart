import 'package:flutter/material.dart';

import '../../constants/custom_values.dart';
import '../../constants/dimensions.dart';

class OldAnimation extends StatelessWidget {
  const OldAnimation(
      {Key? key, required this.animation, required this.controller})
      : super(key: key);

  final Animation<double> animation;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: animation,
          child: Center(
              child: Image.asset(
            'assets/image/logo part 1.png',
            width: Dimensions.splashImg,
          )),
        ),
        Center(
            child: Text(
          CustomValues.APP_NAME,
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font26 * 3,
              fontFamily: "Devonshire"),
        )
            //      Image.asset(
            //   'assets/image/logo part 2.png',
            //   width: 250,
            // )
            ),
      ],
    );
  }
}
