import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';


class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset("assets/images/logo-depilzone.png"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 5),
      ],
    );
  }
}