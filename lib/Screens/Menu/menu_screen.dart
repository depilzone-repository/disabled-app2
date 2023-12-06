import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Menu/components/menu_opciones.dart';
import 'package:flutter_auth/constants.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: AppBar(
          title: const Text(
              "Menú Principal",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ),
        body: Container(
            color: kGray200Color,
            width: double.infinity,
            child: const MenuOpciones()
        )
    );
  }
}

