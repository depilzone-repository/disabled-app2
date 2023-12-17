import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_auth/NavigationScreens/ClientList/client_list_screen.dart';
import 'package:flutter_auth/NavigationScreens/Home/home_screen.dart';
import 'package:flutter_auth/NavigationScreens/NavigationList.dart';
import 'package:flutter_auth/NavigationScreens/ScannerQr/scanner_qr_list_screen.dart';
import 'package:flutter_auth/Screens/V2/Menu/menu_screen.dart';
import 'package:flutter_auth/Services/auth_service.dart';
import 'package:flutter_auth/constants.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../Services/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  final _pageControlller = PageController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  bool showBar = true;
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
      // showBar = _widgetList[_currentIndex].showNabBar;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _incrementCounter();
    });
  }


  @override
  void dispose() {
    super.dispose();
    _pageControlller.dispose();
  }




  @override
  Widget build(BuildContext context) {

    final auth = AuthService();

    final List<NavigationList> widgetList = [
      NavigationList(
          "Inicio",
          const NavigationHomeScreen(),
          true,
          const Icon(Symbols.home_rounded),
          const Icon(Symbols.home_rounded, fill: 1),
          kDepilColor
      ),
      NavigationList(
          "QR",
          const ScannerQrListScreen(),
          true,
          const Icon(Icons.qr_code_scanner_rounded),
          const Icon(Icons.qr_code_scanner_rounded, fill: 1),
          kDepilColor
      ),
      NavigationList(
        "En Espera",
        const ClientListScreen(),
        true,
        Badge(
          label: Text('$counter'),
          child: const Icon(Symbols.airline_seat_recline_normal_rounded),
        ),
        Badge(
          label: Text('$counter'),
          child: const Icon(Symbols.airline_seat_recline_normal_rounded, fill: 1, color: Color(0xff0e2443)),
        ),
          const Color(0xff80b1ff)
      ),
    ];

    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,

        bottomNavigationBar: BottomNavigationBar(

            iconSize: 26,
            backgroundColor: Colors.white,
            unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
            unselectedLabelStyle: TextStyle(color: Colors.grey[400]),

            selectedIconTheme: const IconThemeData(color: kDepilColor),
            selectedLabelStyle: const TextStyle(color: kDepilColor),
            selectedFontSize: 12,

            fixedColor: kDepilColor,
            type: BottomNavigationBarType.fixed,
            onTap: onTapped,
            currentIndex: _currentIndex,
            items: [
              for( var n in widgetList )
                BottomNavigationBarItem(label: n.label, icon: n.icon, activeIcon: n.iconSelected)
            ]

        ),

        appBar: widgetList[_currentIndex].showNabBar ?  AppBar(
          titleSpacing: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const MenuScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        )
                    )
                    // // ignore: avoid_print
                    // print('eee')
                  },
                  color: kDepilColor,
                ),
              ),
              // Stack(
              //   alignment: Alignment.center,
              //   children: <Widget>[
              //     IconButton(
              //       icon: Icon(Icons.mail_outline),
              //       onPressed: (){
              //         // ignore: avoid_print
              //         print('ddd');
              //       },
              //     ),
              //     Positioned(
              //       top: 12.0,
              //       right: 10.0,
              //       width: 10.0,
              //       height: 10.0,
              //       child: Container(
              //         decoration: const BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: kDepilColor,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              Expanded(
                child: Text(
                  'Hola, ${auth.authenticatedUser?.lastname}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
              )
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(defaultPadding / 2, 0, defaultPadding, 0),
                    child: IconButton(
                      color: kDepilColor,
                      onPressed: (){},
                      icon: const Icon(
                          Symbols.notifications_rounded
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: kDepilLightColor
                      ),
                    )
                )
              ],
            )
          ],
        ) : null,
        // body: SizedBox(
        //   width: double.infinity,
        //   height: MediaQuery.of(context).size.height,
        //   child: Stack(
        //     alignment: Alignment.center,
        //     children: <Widget>[
        //       Positioned(
        //         top: 0,
        //         left: 0,
        //         child: Image.asset(
        //           widget.topImage,
        //           width: 120,
        //         ),
        //       ),
        //       Positioned(
        //         bottom: 0,
        //         right: 0,
        //         child: Image.asset(widget.bottomImage, width: 120),
        //       ),
        //       SafeArea(child: widget.child),
        //     ],
        //   ),
        // ),

        body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: widgetList[_currentIndex].widget
        )



        // body: FutureBuilder<bool>(
        //   future: getLoginState(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       // Mientras espera la autenticación, muestra un indicador de carga
        //       return CircularProgressIndicator();
        //     } else {
        //       if (snapshot.hasError) {
        //         // Si hay un error en la autenticación, muestra un mensaje de error
        //         return Text('Error en la autenticación');
        //       } else {
        //         return Text('Autenticado');
        //       }
        //     }
        //   },
        // ),

    );
  }
}
