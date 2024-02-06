import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/cliente_info_cita.dart';
import 'package:flutter_auth/Screens/Home/home_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/models/SalaEspera.dart';

class ListViewSalaEspera extends StatelessWidget{
  final List<SalaEspera> salaEspera;
  final ScrollController? controller;
  const ListViewSalaEspera({
    super.key,
    this.controller,
    required this.salaEspera
  });


  @override
  Widget build(BuildContext contenx){

    return ListView.builder(
      itemCount: salaEspera.length,
      controller: controller, // set this too
      itemBuilder: (_, i) => Card(
        color: kGray100Color,
        elevation: 0,
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(defaultPadding/2, 0, defaultPadding/2, 0),
          horizontalTitleGap: 10,
          minVerticalPadding: defaultPadding,
          leadingAndTrailingTextStyle: const TextStyle(
              fontSize: 30
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            child: SvgPicture.asset(
              i % 2 == 0 ? 'assets/images/Femenino.svg' : 'assets/images/Masculino.svg',
              height: 100.0,
              width: 100.0,
              allowDrawingOutsideViewBox: false,
            ),
          ),
          title: Text("${salaEspera[i].nombres} ${salaEspera[i].apellidos}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),),
          subtitle: Text("${salaEspera[i].estado} ", style: TextStyle(fontSize: 12)),
          trailing: PopupMenuButton<SampleItem>(
            offset: const Offset(0, 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            color: Colors.white,
            surfaceTintColor: Colors.transparent,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              PopupMenuItem<SampleItem>(
                  onTap: ()  {
                    showInfoClientDialog(context);
                  },
                  value: SampleItem.itemOne,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, defaultPadding/2, 0),
                        child: const Icon(Icons.info_rounded),
                      ),
                      const Text("Info")
                    ],
                  )
              ),
              PopupMenuItem<SampleItem>(
                  value: SampleItem.itemOne,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, defaultPadding/2, 0),
                        child: const Icon(Icons.front_hand_rounded),
                      ),
                      const Text("Atender")
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );

  }
}