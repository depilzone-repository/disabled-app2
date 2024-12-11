import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Splash/splash_screen_sala_de_espera.dart';
import 'package:flutter_auth/Services/shared_preferences.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../shared/models/Usuario.dart';


class ScannerQrCitaScreen extends StatefulWidget {
  const ScannerQrCitaScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ScannerQrCitaScreenState();
}

class _ScannerQrCitaScreenState extends State<ScannerQrCitaScreen> {

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Usuario? currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _cargarUsuario();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _cargarUsuario() async {
    Usuario? user = await getUsuario();
    setState(() {
      currentUser = user!;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          // style: IconButton.styleFrom(
          //   // backgroundColor: Colors.red
          // ),
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(FeatherIcons.chevronLeft, size: 30, color: Colors.white),
          //replace with our own icon data.
        ),
        title: const Text(
          'Escanear Cita',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
            children: <Widget>[
                Expanded(
                  child: _buildQrView(context)
                ),
            ]
        ),
      )
    );
  }


  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: kDepilColor,
          borderRadius: 30,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {

      controller.pauseCamera(); //

      setState(() async {
        result = scanData;

        // // ignore: avoid_print
        print('Código Cita: ${result!.code!}');

        if (result != null){

          final qrResult = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SplashScreenSalaDeEspera(idCita: int.parse(result!.code!), idSede: currentUser!.idSede!,))
          );

          // When a BuildContext is used from a StatefulWidget, the mounted property
          // must be checked after an asynchronous gap.
          if (!mounted) return;


          // After the Selection Screen returns a result, hide any previous snackbars
          // and show the new result.
          if(result != null){
            // Navigator.pop(context);
          }


          // ScaffoldMessenger.of(context).showSnackBar(
          //    SnackBar(content: Text(result!.code != null ? result!.code!: "aaa"))
          // );

          // await showQrDialog(context).then((bool? val) {
          //
          //   // ignore: avoid_print
          //   // print(val);
          //   if(val != null){
          //     controller.resumeCamera();
          //
          //     // ignore: avoid_print
          //     print(val);
          //   }
          //
          //   // formControllers['password']?.text = val ? val : '';
          //   // setState(() {
          //   //   clave = val;
          //   // });
          // });

        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

}