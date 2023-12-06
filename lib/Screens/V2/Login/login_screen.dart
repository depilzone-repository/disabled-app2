import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

import 'components/login_form.dart';
// import 'components/login_screen_top_image.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
          width: double.infinity - 200,
          child: Column(
            children: [
              Spacer(),
              SizedBox(
                width: (MediaQuery.of(context).size.width < 750) ? 350 : 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/images/logo-depilzone.png"),
                    SizedBox(height: 100),
                    LoginForm(),
                  ],
                )
              ),
              Spacer()
            ],
          )
        )
        // SizedBox(
        //     width: double.infinity,
        //     height: MediaQuery.of(context).size.height,
        //     child: const Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Column(
        //           children: [
        //             // LoginScreenTopImage(),
        //             Spacer(),
        //             Expanded(
        //               // flex: 8,
        //               child: LoginForm(),
        //             ),
        //             Spacer(),
        //           ],
        //         ),
        //       ],
        //     )
        // )
    );
  }
}