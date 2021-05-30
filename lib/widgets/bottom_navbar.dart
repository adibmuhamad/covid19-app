import 'package:flutter/material.dart';

import 'package:covid_app/theme.dart';

class BottomNavbar extends StatelessWidget {

  final String imageUrl;
  final bool isActive;

  BottomNavbar({this.imageUrl = '', this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        isActive ? Image.asset(
          '${imageUrl}_active.png',
          width: 26,
        ): Image.asset(
          '${imageUrl}.png',
          width: 26,
        ),
        Spacer(),
        isActive ? Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(1000),
              )
          ),
        ) : Container()
      ],
    );
  }
}
