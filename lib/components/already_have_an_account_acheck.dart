import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "¿No tienes una cuenta? ",
          style: TextStyle(color: kDepilColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: const Text(
            "Registrate",
            style: TextStyle(
              color: kDepilColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
