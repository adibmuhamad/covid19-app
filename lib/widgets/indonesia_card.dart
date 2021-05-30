import 'package:covid_app/models/province_cases.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class IndonesiaCard extends StatelessWidget {

  final ProvinceCases cases;

  IndonesiaCard(this.cases);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cases.name,
          style: blackTextStyle.copyWith(
              fontSize: 18
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          'Positif : ${cases.positif == 0 ? '-' : cases.positif}',
          style: blackTextStyle.copyWith(
              fontSize: 14
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          'Recovered : ${cases.sembuh == 0 ? '-' : cases.sembuh}',
          style: blackTextStyle.copyWith(
              fontSize: 14
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          'Deaths : ${cases.meninggal == 0 ? '-' : cases.meninggal}',
          style: blackTextStyle.copyWith(
              fontSize: 14
          ),
        ),
      ],
    );
  }
}
