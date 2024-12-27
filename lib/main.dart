import 'package:buangin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/flash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/manage_account_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';

void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buangin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const WasteManagementApp(),
        '/profile': (context) => const ProfileScreen(),
        '/manageAccount': (context) => const ManageAccountScreen(),
      },
    );
  }
}
