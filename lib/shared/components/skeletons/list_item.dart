import 'package:flutter/material.dart';

import '../../../constants.dart';

class ListItemSkeleton extends StatelessWidget{

  final int itemCount;
  final ScrollController? controller;
  const ListItemSkeleton({
    super.key,
    required this.itemCount,
    this.controller
  });



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        controller: controller, // set this too
        itemBuilder: (_, i) => Card(
          color: kGray100Color,
          elevation: 0,
          child: ListTile(
            horizontalTitleGap: 10,
            minVerticalPadding: defaultPadding,
            leadingAndTrailingTextStyle: const TextStyle(
                fontSize: 30
            ),
            leading: const CircleAvatar(
              backgroundColor: kGray300Color,
            ),
            title: Container(
                width: MediaQuery.of(context).size.width,
                height: 18,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kGray300Color
                )
            ),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kGray300Color
                      )
                  )
                ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kGray300Color
                  ),
                )
              ],
            )
          ),
        ),
    );
  }
}