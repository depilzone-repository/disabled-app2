import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';


class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {


  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        Expanded(
            child: Container(
              color: kGray200Color
            )
        )
      ],
    );
  }
}