import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/responsive.dart';

import '../../components/background.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) :  super(key: key);

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
    Key? key
  }) : super(key: key);

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();

}

class _MobileHomeScreenState extends State<MobileHomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: ListView(
              children: [
                CarouselSlider(
                  items: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Row(
                          children: [
                              Icon(
                                  Icons.qr_code_rounded,
                                  color: Colors.white,
                                  size: 50,
                                  weight: 1.0,
                              ),
                              Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "50% descuento en zonas intimas",
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                      )
                                    ],
                                  )
                              )
                          ]
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),


                  ],
                  options: CarouselOptions(
                    height: 100,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
                CarouselSlider(
                  items: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),


                  ],
                  options: CarouselOptions(
                    height: 100,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
                CarouselSlider(
                  items: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),


                  ],
                  options: CarouselOptions(
                    height: 100,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
                CarouselSlider(
                  items: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),


                  ],
                  options: CarouselOptions(
                    height: 100,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
                CarouselSlider(
                  items: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),


                  ],
                  options: CarouselOptions(
                    height: 100,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
                CarouselSlider(
                  items: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),


                  ],
                  options: CarouselOptions(
                    height: 100,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
                CarouselSlider(
                  items: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 350,
                      padding: const EdgeInsets.all(defaultPadding) ,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                              'backgrounds/aqua-marine.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text("1"),
                    ),


                  ],
                  options: CarouselOptions(
                    height: 100,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
              ],
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


