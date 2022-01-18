import 'package:flutter/material.dart';

import 'Home.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D47A1),
      body: Center(
        child: Container(
          width: 350,
          height: 350,
          child: Image.asset("assets/icone.png"),
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home())
      );
    });
  }
}
