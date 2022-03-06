import 'package:flutter/material.dart';
import 'package:rently_map_project/splash_page.dart';

void main()=>runApp(RentlyApp());

class RentlyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: SplashPage(),
    );
  }
}
