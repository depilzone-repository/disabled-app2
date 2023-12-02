import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/cliente_info_cita.dart';
import 'package:flutter_auth/Screens/Home/home_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListViewClienteEspera extends StatelessWidget{
  final ScrollController? controller;
  const ListViewClienteEspera({
    super.key,
    this.controller
  });


  @override
  Widget build(BuildContext contenx){

    return ListView.builder(
      itemCount: 10,
      controller: controller, // set this too
      itemBuilder: (_, i) => Card(
        color: kGray100Color,
        elevation: 0,
        child: ListTile(
          horizontalTitleGap: 10,
          minVerticalPadding: defaultPadding,
          leadingAndTrailingTextStyle: TextStyle(
              fontSize: 30
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 40,
            child: SvgPicture.asset(
              i % 2 == 0 ? 'assets/images/Femenino.svg' : 'assets/images/Masculino.svg',
              height: 100.0,
              width: 100.0,
              allowDrawingOutsideViewBox: false,
            ),
          ),
          title: Text("Pepe Lucho sdfasdfasd fasdf asdf asdf asd f", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),),
          subtitle: Text("En espera", style: TextStyle(fontSize: 12)),
          trailing: PopupMenuButton<SampleItem>(
            offset: Offset(0, 40),
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
                        padding: EdgeInsets.fromLTRB(0, 0, defaultPadding/2, 0),
                        child: Icon(Icons.info_rounded),
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
                        padding: EdgeInsets.fromLTRB(0, 0, defaultPadding/2, 0),
                        child: Icon(Icons.front_hand_rounded),
                      ),
                      Text("Atender")
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