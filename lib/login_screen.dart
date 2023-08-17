import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(), password: _passwordController.text.trim());
  }
  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  var formKey= GlobalKey<FormState>();
  void openSignupScreen(){
    Navigator.of(context).pushReplacementNamed("signupScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // image
                  Image.asset(
                    "assets/login.png",
                    height: 200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Title
                  const Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //subtitle
                  const Text(
                    "welcome back ! Nice to see you again",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // EmailTextField

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child:  TextFormField(
                        controller:_emailController,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Email can't be empty";
                          }
                          return null;
                        },
                        decoration:const InputDecoration(
                          labelText: "Email",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  //PasswordTextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText:true,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Password can't be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Password",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                      ),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    height: 15,
                    child: MaterialButton(
                      onPressed: (){
                       if(formKey.currentState!.validate());
                      },
                    ),
                  ),

                  //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: signIn,
                        child: Container(
                         padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Center(
                              child: Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )),
                        ),
                      ),
                    ),


                  const SizedBox(
                    height: 20,
                  ),

                  // Text:sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text(
                        "Not yet a member?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                         GestureDetector(
                           onTap: openSignupScreen,
                           child:const Text(
                            "Sign up Now",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                         ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
