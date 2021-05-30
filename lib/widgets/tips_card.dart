import 'package:flutter/material.dart';

import 'package:covid_app/theme.dart';

class TipCard extends StatelessWidget {

  final String imageUrl;
  final String desc;

  TipCard({this.imageUrl = '', this.desc = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          height: 80,
          width: 80,
          fit: BoxFit.cover
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          desc,
          style: blackTextStyle.copyWith(
            fontSize: 14
          ),
        )
      ],
    );
  }
}


