import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../shared/globals/data.dart';


class SplashScreen extends StatelessWidget {
  final String idCita;
  const SplashScreen({super.key, required this.idCita});

  @override
  Widget build(BuildContext context) {

    return Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kDepilColor, Colors.indigo],
                    stops: [0.25, 0.75],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
              ),
              child: const Column(
                children: <Widget>[
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 70),
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Validando cita...',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                          ),
                        ],
                      )
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
}