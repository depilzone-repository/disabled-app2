import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/shared/globals/data.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return Scaffold(
            body: Container(
              color: kDepilColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/images/logo-depilzone-blanco.png", width: 280,),
                          // const Text(
                          //   "Te da la bienvenida",
                          //   style: TextStyle(
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w500,
                          //       color: Colors.white
                          //   ),
                          // ),
                          const SizedBox(height: 70),
                          const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            appProvider.text,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                          ),
                        ],
                      )
                  ),
                  const Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text("Desarrollado por Depilzone", style: TextStyle(
                        color: Colors.white
                    )),
                  )

                ],
              ),
            ),
          );
        }
    );
  }
}