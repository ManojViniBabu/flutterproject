import 'package:onion/screens/SplashScreen.dart';
import 'package:flutter/material.dart';



void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: ('Restaurant'),
     // theme: ThemeData(primarySwatch: Colors.black87),
      debugShowCheckedModeBanner: false,
      home:SplashScreen()
      ,


    );
  }
}





