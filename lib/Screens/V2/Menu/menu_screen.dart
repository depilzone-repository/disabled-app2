import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/V2/Menu/components/menu_opciones.dart';
import 'package:flutter_auth/constants.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: AppBar(
          centerTitle: true,
          leading: const BackButton(
            color: kGray400Color,
          ),
          backgroundColor: Colors.white,
          title: const Text(
              "Menú Principal",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ),
        body: Container(
            color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: const MenuOpciones()
        )
    );
  }
}

