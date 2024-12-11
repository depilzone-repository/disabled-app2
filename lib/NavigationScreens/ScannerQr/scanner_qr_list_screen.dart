import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/QrEvents/scanner_qr_cita.dart';
import 'package:flutter_auth/constants.dart';
import 'package:material_symbols_icons/symbols.dart';

class ScannerQrListScreen extends StatefulWidget {
  const ScannerQrListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ScannerQrListScreenState();
}

class _ScannerQrListScreenState extends State<ScannerQrListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: Colors.white,
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            // const Padding(
            //     padding: EdgeInsets.fromLTRB(0, 0, 0, defaultPadding),
            //     child: Text("Eventos QR", style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.w500))
            // ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 180,
                  child: IconButton(
                    onPressed: (){
                       Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const ScannerQrCitaScreen(),
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
                      );
                    },
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(Symbols.qr_code_scanner_rounded, size: 60, color: Colors.indigo[400]),
                        const SizedBox(height: 10),
                        Text("Escanear", style: TextStyle(color: Colors.indigo[400], fontSize: 16, fontWeight: FontWeight.w500, height: 1.2),textAlign: TextAlign.center),
                        Text("Cita", style: TextStyle(color: Colors.indigo[400], fontSize: 16, fontWeight: FontWeight.w500, height: 1.2),textAlign: TextAlign.center)
                      ],
                    ),
                    style: IconButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.fromLTRB(defaultPadding/2, defaultPadding, defaultPadding/2, defaultPadding),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(width: 4, color: Colors.indigo[400]!)
                      )
                    )
                  )
                ),
                SizedBox(
                    width: 180,
                    child: IconButton(
                      onPressed: (){
                      },
                      icon: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(Symbols.qr_code_scanner_rounded, size: 60, color: Colors.indigo[400]),
                          const SizedBox(height: 10),
                          Text("Escanear", style: TextStyle(color: Colors.indigo[400], fontSize: 16, height: 1.2, fontWeight: FontWeight.w500),textAlign: TextAlign.center),
                          Text("Descuento", style: TextStyle(color: Colors.indigo[400], fontSize: 16, height: 1.2, fontWeight: FontWeight.w500),textAlign: TextAlign.center)
                        ],
                      ),
                        style: IconButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.fromLTRB(defaultPadding/2, defaultPadding, defaultPadding/2, defaultPadding),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(width: 4, color: Colors.indigo[400]!)
                            )
                        )
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
