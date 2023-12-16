import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'Blocs/auth_bloc.dart';
import 'Screens/V2/Home/home_screen.dart';
import 'Screens/V2/Login/login_screen.dart';
import 'Services/shared_preferences.dart';

// void main() => runApp(const MyApp());
void main() async{

//   //Remove this method to stop OneSignal Debugging
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//
//   OneSignal.initialize("b68b56b5-86aa-41b0-941c-ec13680666e9");
//
// // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//   OneSignal.Notifications.requestPermission(true);





  // We need to call it manually,
  // because we going to call setPreferredOrientations()
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();


  // Verificar el estado de inicio de sesión
  bool isLoggedIn = await getLoginState();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

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
            )
        ),
          initialRoute: isLoggedIn ? '/home' : '/login',
          routes: {
            '/login': (context) => BlocProvider(
              create: (context) => AuthBloc(),
              child: const LoginScreen(),
            ),
            '/home': (context) =>  isLoggedIn ? const HomeScreen() : const LoginScreen(),
            // '/qr': (context) => const ScannerQrScreen(),
            // '/waiting': (context) => const ClientListScreen(),
          },

          // home: const AuthWrapper(),

          // home: const WelcomeScreen(),
    );
  }
}
