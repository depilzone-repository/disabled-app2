import 'package:flutter/material.dart';
import 'package:flutter_auth/responsive.dart';

import '../../components/background.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.clave}) :  super(key: key);
  final String clave;

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  String _clave = '';

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(clave: widget.clave),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm(clave: widget.clave),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: avoid_print
    print('LoginScren ${widget.clave}');
  }
}



class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({
    Key? key, required this.clave
  }) : super(key: key);
  final String clave;

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();

}

class _MobileLoginScreenState extends State<MobileLoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(clave: widget.clave),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: avoid_print
    print('LoginScrenMobile ${widget.clave}');
  }
}
