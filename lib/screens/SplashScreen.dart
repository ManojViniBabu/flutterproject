import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'HomePage.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[


          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/splashscreen.jpg'),
                  fit: BoxFit.cover,

                )


            ),
            child:
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                child: Container(color: Colors.black.withOpacity(0.5),
                )

            ),


          )
          ,
          Container(child: Center(child: Text('onion.',style: TextStyle(fontSize: 50.0,color: Colors.white,fontFamily: 'Montserrat',fontWeight: FontWeight.w100),),)),

        ],
      ),
    );
  }
}