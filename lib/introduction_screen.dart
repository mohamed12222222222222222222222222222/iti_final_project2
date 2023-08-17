import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:iti_final_project2/app_screen.dart';
import 'package:iti_final_project2/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
   IntroScreen({Key? key}) : super(key: key);
  final List<PageViewModel> pages = [
    PageViewModel(
        title: "First Page",
        body: "Description",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("Let's Go"),
        ),
        image: Center(
          child: Image.asset("assets/1.png"),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 30, fontWeight: FontWeight.w700))),
    PageViewModel(
        title: "Second Page",
        body: "Description",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("Let's Go"),
        ),
        image: Center(
          child: Image.asset("assets/2.png"),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 30, fontWeight: FontWeight.w700))),
    PageViewModel(
        title: "Third Page",
        body: "Description",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("Let's Go"),
        ),
        image: Center(
          child: Image.asset("assets/3.png"),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 30, fontWeight: FontWeight.w700))),
    PageViewModel(
        title: "fourth Page",
        body: "Description",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("Let's Go"),
        ),
        image: Center(
          child: Image.asset("assets/4.png"),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
            TextStyle(fontSize: 30, fontWeight: FontWeight.w700))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Fruits Store"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Colors.blue,
            activeSize: Size.square(15),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text("Done",style: TextStyle(fontSize:20),),
          showSkipButton: true,
          skip: const Text("skip",style: TextStyle(fontSize:20),),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward,size: 25,),
          onDone: ()=>onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs =await SharedPreferences.getInstance();
    await prefs.setBool("ON_BOARDING", false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Auth())
    );
  }
}
