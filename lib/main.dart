import 'package:flutter/material.dart';
import 'package:demo_sdk/demo_sdk.dart';
import 'screens/login_page.dart';

void main() {
  // Initialize SDK before starting the application
  LoginSdk.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Application',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),

      home: const LoginPage(),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'screens/login_page.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Login Application',
//
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//
//       home: const LoginPage(),
//     );
//   }
// }