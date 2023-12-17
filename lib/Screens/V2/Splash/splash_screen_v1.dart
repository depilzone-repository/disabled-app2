import 'package:flutter/material.dart';

class SplashScreenV1 extends StatelessWidget{
  const SplashScreenV1({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text("Splash Screen")
        )
      )
    );
  }
}