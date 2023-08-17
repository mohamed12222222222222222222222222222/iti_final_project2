import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project2/app_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Text("Hello, your are signed in",style: TextStyle(
            fontSize: 25,
          ),),
         const Text("user.email",style: TextStyle(
            fontSize: 25,
          ),),
          MaterialButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
            },
            color: Colors.teal,
            child:const Text("Sign Out"),
          ),
          MaterialButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AppScreen())
              );
            },
            color: Colors.teal,
            child:const Text("Go to App"),
          ),
        ],
      ),
      ),
    );
  }
}
