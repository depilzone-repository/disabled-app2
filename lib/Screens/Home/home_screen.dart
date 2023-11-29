
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/descuentos.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/responsive.dart';

import '../../components/background.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileHomeScreen(),
          desktop: Row(
            children: [

            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}



class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({
    super.key
  });

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();

}

class _MobileHomeScreenState extends State<MobileHomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: kGray200Color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, defaultPadding*3),
            decoration: const BoxDecoration(
              color: kDepilColor,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: '!Hola, ',
                style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Poppins'),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Yosel',
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  TextSpan(
                    text: '!',
                  ),
                ],
              ),
            )
          ),
          // const SizedBox(
          //   child: Descuentos()
          // ),

          Transform.translate(
              offset: const Offset(0, -defaultPadding*2),
              child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        for(int i = 0; i < 7; i++)
                                          boxPromociones(7, i)
                                      ]
                                  )
                              )
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0 , defaultPadding, 0 , 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(defaultPadding, 0, 0, 0),
                                    child: Text("Hay 7 box libres", style: TextStyle(fontWeight: FontWeight.w500, color: kGray600Color, fontSize: 16)),
                                ),
                                Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for(int i = 0; i < 7; i++)
                                            BoxButton(7, i)
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                        ]
                    )
                ),
          ),
        ],
      )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: avoid_print
  }
}





Widget BoxButton(int lenght, int index){
  return Container(
      margin: EdgeInsets.fromLTRB(defaultPadding, 0, ((lenght - 1) == index) ? defaultPadding : 0, defaultPadding),
      // width: 80,
      alignment: Alignment.center,
      child: OutlinedButton(
          onPressed: () async{

          },
          style: OutlinedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Colors.indigo,
              surfaceTintColor: Colors.transparent,
              side: const BorderSide(
                  width: 2,
                  color: Colors.indigo
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              )
          ),
          child: Text(
              'Box ${index.toString().padLeft(2, '0')}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16
              )
          )
      )
  );
}


Widget boxPromociones(int lenght, int index){
  return Container(
      padding:  const EdgeInsets.fromLTRB(defaultPadding*2, defaultPadding*2, defaultPadding*2, defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      margin: EdgeInsets.fromLTRB(defaultPadding, 0, ((lenght-1) == index) ? defaultPadding : 0 , defaultPadding),
      width: 280,
      alignment: Alignment.center,
      child: const Descuentos()
  );
}


