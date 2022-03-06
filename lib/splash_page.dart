import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rently_map_project/home_page.dart';

class SplashPage extends StatefulWidget {

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(Duration(seconds: 5),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade200,
      body: Container(
        alignment: Alignment.center,
        child: Text("RENTLY",style: TextStyle(
          color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700
        ),),
      ),
    );
  }
}
