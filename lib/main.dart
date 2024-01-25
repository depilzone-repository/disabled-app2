import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/V2/Home/home_screen.dart';
import 'package:flutter_auth/Screens/V2/Splash/splash_screen_v1.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/shared/globals/data.dart';
import 'package:provider/provider.dart';

import 'Screens/Login/login_screen.dart';
import 'shared/services/inicio_service.dart';


void main() async{


//   //Remove this method to stop OneSignal Debugging
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//
//   OneSignal.initialize("b68b56b5-86aa-41b0-941c-ec13680666e9");
//
// // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//   OneSignal.Notifications.requestPermission(true);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(isLoggedIn: true),
    ),
  );

}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var appProvider = Provider.of<AppProvider>(context, listen: false);

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
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: kGray200Color,
                        width: 2.5,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignOutside
                      ),
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        color: kGray200Color,
                        width: 2.5
                    )
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        color: kGray300Color,
                        width: 2.5
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        color: kWarningColor,
                        width: 2.5
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        color: kWarningColor,
                        width: 2.5
                    ),
                  ),
            )
        ),
          // initialRoute: isLoggedIn ? '/home' : '/login',
          routes: {
            // '/login': (context) => BlocProvider(
            //   create: (context) => AuthBloc(),
            //   child: const LoginScreen(),
            // ),
            '/login': (context) => const LoginScreen(),
            // '/home': (context) =>  isLoggedIn ? const LoginScreen() : const LoginScreen(),
            '/home': (context) =>  const HomeScreen(),
            // '/qr': (context) => const ScannerQrScreen(),
            // '/waiting': (context) => const ClientListScreen(),
          },

          // home: ChangeNotifierProvider(
          //   create: (context) => AppData(),
          //   child: TaskScreen(),
          // )

          home: FutureBuilder(
            future: fetchDataAndUpdateNotifier(appProvider),
            builder: (context, snapshot){
              // log(context.watch<AppProvider>().usuario!.apellido);
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  // return Text('Data loaded successfully: ${appProvider.text}');
                  return const SplashScreen();
                case ConnectionState.done:
                // Aquí puedes realizar acciones después de que el Future<void> se complete
                  return appProvider.usuario != null ?  const HomeScreen() : const LoginScreen();
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Text('Error:');
                  }
              }
            },
          ),

          // home: const WelcomeScreen(),
    );
  }
}
