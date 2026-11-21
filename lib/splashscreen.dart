import 'package:expense_app/home_screen.dart';
import 'package:expense_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
      checkLogin();
    }

    Future<void> checkLogin() async {
    await Future.delayed(Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (!mounted) return ;
    if(isLoggedIn == true){
         Navigator .pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen()));
      
    }
    else {
      Navigator .pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0XFF6E72EA),Color(0XFF4A4EC2),],
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/AppIcon(3).png"),
          ],
        ),
      ),

    );
  }
}
