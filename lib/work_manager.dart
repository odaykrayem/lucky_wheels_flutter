// import 'package:flutter/material.dart';
// import 'package:workmanager/workmanager.dart';

// void callbackDispatcher() {
//   Workmanager().executeTask((taskName, inputData) {
//     debugPrint("hi" + taskName);
//     return Future.value(true);
//   });
// }

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Workmanager().initialize(callbackDispatcher);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               'lll',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Workmanager().registerOneOffTask(
//           //   'uniqueName',
//           //   'taskName',
//           //   constraints: Constraints(networkType: NetworkType.connected),
//           //   initialDelay: const Duration(seconds: 5),
//           // );

//           Workmanager().cancelByUniqueName("periodic");
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     Workmanager().registerPeriodicTask("uniqueName1", "periodic",
//         frequency: Duration(minutes: 15));
//   }
// }
