import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:iti_final_project2/app_screen.dart';
import 'package:iti_final_project2/auth.dart';
import 'package:iti_final_project2/home_screen.dart';
import 'package:iti_final_project2/introduction_screen.dart';
import 'package:iti_final_project2/login_screen.dart';
import 'package:iti_final_project2/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool show = true;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs =await SharedPreferences.getInstance();
  show = prefs.getBool("ON_BOARDING") ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
      routes: {
        'homeScreen':(context)=>const HomeScreen(),
        'signupScreen':(context)=>const SignupScreen(),
        'loginScreen':(context)=>const LoginScreen(),
      },
    );
  }
}

