import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login_page.dart';
import 'home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}



class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}



class _MyAppState extends State<MyApp> {


  bool isLoggedIn = false;

  String userEmail = "";



  void loginUser(String email){

    setState(() {

      isLoggedIn = true;
      userEmail = email;

    });

  }




  void logoutUser(){

    setState(() {

      isLoggedIn = false;
      userEmail = "";

    });


  }





  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      debugShowCheckedModeBanner: false,


      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1E3C72),
        ),

        useMaterial3: true,

      ),



      home: isLoggedIn

          ? HomePage(

      

              onLogout: logoutUser,

            )


          : LoginPage(

              onLoginSuccess: loginUser,

            ),


    );


  }

}