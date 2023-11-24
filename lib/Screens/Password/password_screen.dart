import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Password/components/password_bottom.dart';
import 'package:flutter_auth/Screens/Password/components/password_top.dart';
import 'package:flutter_auth/Screens/Welcome/components/login_signup_btn.dart';

import '../../components/background.dart';
import '../../responsive.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({Key? key, required String clave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: PasswordTop(clave: '123456'),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: MobilePasswordScreen(),
          ),
        ),
      ),
    );
  }
}

class MobilePasswordScreen extends StatelessWidget {
  const MobilePasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PasswordTop(clave: '123456'),
        // Row(
        //   children: [
        //     Spacer(),
        //     Expanded(
        //       flex: 8,
        //       child: LoginAndSignupBtn(),
        //     ),
        //     Spacer(),
        //   ],
        // ),
      ],
    );
  }
}
