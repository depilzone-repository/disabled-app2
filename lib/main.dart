import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

// void main() => runApp(const MyApp());
void main() {
  // We need to call it manually,
  // because we going to call setPreferredOrientations()
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(

          fontFamily: 'Poppins',
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kDepilColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56)
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(

            errorStyle: TextStyle(
              color: kWarningColor,
            ),

            filled: true,
            //fillColor: kGray200Color,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            // iconColor: kGray200Color,
            prefixIconColor: kGray400Color,
            contentPadding:  EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
                border:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: kGray200Color,
                      width: 2.5,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside
                    ),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                      color: kGray200Color,
                      width: 2.5
                  )
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                      color: kGray300Color,
                      width: 2.5
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                      color: kWarningColor,
                      width: 2.5
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                      color: kWarningColor,
                      width: 2.5
                  ),
                ),
          )),

          home: const WelcomeScreen(),
    );
  }
}
