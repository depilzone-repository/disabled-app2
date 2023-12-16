import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenV1 extends StatelessWidget{
  const SplashScreenV1({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text("Splash Screen")
        )
      )
    );
  }
}