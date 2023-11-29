import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';

import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {

  const LoginAndSignupBtn({
    super.key,
  });

  void columnFunction(){
    print('dd');
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen(clave: '');
                },
              ),
            );
          },
          child: Text(
            "Iniciar Sesión".toUpperCase(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kGray100Color,
            elevation: 0,
          ),
          child: Text(
            "Regristrarme".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

