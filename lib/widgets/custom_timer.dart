// import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:flutter/material.dart';
// import 'package:lucky_wheels_flutter/background_nots.dart';

// class CustomTimer extends StatelessWidget {
//   final int duration;
//   final CountDownController controller;
//   final VoidCallback onStart;
//   final VoidCallback onComplete;
//   final Color backgroundColor;
//   final Color ringColor;
//   final Color fillColor;
//   final Color textColor;

//   const CustomTimer(
//       {Key? key,
//       required this.duration,
//       required this.controller,
//       required this.onStart,
//       required this.onComplete,
//       this.backgroundColor = const Color(0XFFFDE2E4),
//       this.ringColor = const Color(0xFFE0E0E0),
//       this.fillColor = const Color(0XFFffadad),
//       this.textColor = Colors.white})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: CircularCountDownTimer(
//       // Countdown duration in Seconds.
//       duration: duration,

//       // Countdown initial elapsed Duration in Seconds.
//       initialDuration: 0,

//       // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
//       controller: controller,

//       // Width of the Countdown Widget.
//       width: MediaQuery.of(context).size.width / 2,
// // Height of the Countdown Widget.
//       height: MediaQuery.of(context).size.height / 2,

//       // Ring Color for Countdown Widget.
//       ringColor: ringColor,

//       // Ring Gradient for Countdown Widget.
//       ringGradient: null,

//       // Filling Color for Countdown Widget.
//       fillColor: fillColor,

//       // Filling Gradient for Countdown Widget.
//       fillGradient: null,

//       // Background Color for Countdown Widget.
//       backgroundColor: backgroundColor,

//       // Background Gradient for Countdown Widget.
//       backgroundGradient: null,

//       // Border Thickness of the Countdown Ring.
//       strokeWidth: 20.0,

//       // Begin and end contours with a flat edge and no extension.
//       strokeCap: StrokeCap.round,

//       // Text Style for Countdown Text.
//       textStyle: TextStyle(
//         fontSize: 33.0,
//         color: textColor,
//         fontWeight: FontWeight.bold,
//       ),

//       // Format for the Countdown Text.
//       textFormat: CountdownTextFormat.HH_MM_SS,

//       // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
//       isReverse: true,

//       // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
//       isReverseAnimation: false,

//       // Handles visibility of the Countdown Text.
//       isTimerTextShown: true,

//       // Handles the timer start.
//       autoStart: false,

//       // This Callback will execute when the Countdown Starts.
//       onStart: onStart,

//       // This Callback will execute when the Countdown Ends.
//       onComplete: onComplete,
//     ));
//   }
// }
