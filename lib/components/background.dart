import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

class Background extends StatefulWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,
    this.topImage = "assets/images/main_top.png",
    this.bottomImage = "assets/images/login_bottom.png",
  });

  final String topImage, bottomImage;

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background>{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: kDepilColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0),
                child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => {
                      if( _scaffoldKey.currentState!.hasDrawer ){
                        _scaffoldKey.currentState!.openDrawer()
                      }
                      // // ignore: avoid_print
                      // print('eee')
                    },
                    color: Colors.white,
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
            // const Expanded(
            //   child: Text(
            //     'Hola, Yosel Edwin',
            //     textAlign: TextAlign.left,
            //     style: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400,
            //       color: Colors.white
            //     ),
            //   ),
            // )
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
                            color: Colors.white,
                            onPressed: (){},
                            icon: const Icon(
                                Icons.notifications_outlined
                            )
                        )
                    )
                ],
            )
        ],
      ),
      drawer:  Drawer(
        width: 320.0,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: kGradiantVerticalColor
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Cerrar Sesión'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const WelcomeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                widget.topImage,
                width: 120,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(widget.bottomImage, width: 120),
            ),
            SafeArea(child: widget.child),
          ],
        ),
      ),
    );
  }
}
