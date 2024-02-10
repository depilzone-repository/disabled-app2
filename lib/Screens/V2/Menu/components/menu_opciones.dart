import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/V2/AgendarCita/agendar_cita_screen.dart';
import 'package:flutter_auth/Screens/V2/ListaCitas/lista_citas_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../Services/shared_preferences.dart';


class MenuOpciones extends StatelessWidget{
  const MenuOpciones({super.key});


  @override
  Widget build(BuildContext context){


    return ListView(
      children: [
        ExpansionTile(
            shape: const Border(
              top: BorderSide.none,
              bottom: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide.none,
            ),
            initiallyExpanded: true,
            title: const Text("Operaciones", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            backgroundColor: kGray200Color,
            collapsedBackgroundColor: kGray200Color,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(defaultPadding, 0 ,defaultPadding , 0),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        onTap: (){
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const AgendarCitaScreen(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = Offset(0.0, -1.0);
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
                        leading: Icon(FeatherIcons.calendar, color: Colors.green[300],size: 30),
                        title: const Text('Agendar Cita', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: kGray800Color)),
                        trailing: IconButton(
                            onPressed: (){},
                            icon: const Icon(Symbols.chevron_right_rounded, color: kDepilColor,)
                        )
                    ),
                    const Divider(height: 0),
                    ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        onTap: (){
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const ListaCitasScreen(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              )
                          );
                        },
                        leading: Icon(FeatherIcons.list, color: Colors.indigo[30],size: 30),
                        title: const Text('Lista de Citas', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: kGray800Color)),
                        trailing: IconButton(
                            onPressed: (){},
                            icon: const Icon(Symbols.chevron_right_rounded, color: kDepilColor,)
                        )
                    ),
                    const Divider(height: 0),
                    ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        onTap: (){
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const AgendarCitaScreen(),
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
                        leading: Icon(FeatherIcons.userPlus, color: Colors.blueAccent[300],size: 30),
                        title: const Text('Agregar Cliente', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: kGray800Color)),
                        trailing: IconButton(
                            onPressed: (){},
                            icon: const Icon(Symbols.chevron_right_rounded, color: kDepilColor,)
                        )
                    ),
                    const Divider(height: 0),
                  ],
                ),
              )
            ],
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding*2, defaultPadding, defaultPadding*2),
            child: InkWell(
                onTap: () {

                  // Guardar el estado de inicio de sesión
                  logout();

                  Navigator.pushReplacementNamed(context, '/login');

                },
                child: const Text(
                    'Cerrar Sesión',
                    style: TextStyle(color: kDepilColor, decoration: TextDecoration.underline, fontWeight: FontWeight.w500,decorationColor: kDepilColor),
                    textAlign: TextAlign.center,
                )
            )
        )
      ],
    );
  }

}