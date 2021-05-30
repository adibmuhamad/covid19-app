import 'package:covid_app/models/global_cases.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class WorldwideCard extends StatelessWidget {

  final GlobalCases cases;

  WorldwideCard(this.cases);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cases.country,
          style: blackTextStyle.copyWith(
              fontSize: 18
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          'Confirmed : ${cases.confirmed == 0 ? '-' : cases.confirmed}',
          style: blackTextStyle.copyWith(
              fontSize: 14
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          'Active : ${cases.active == 0 ? '-' : cases.active}',
          style: blackTextStyle.copyWith(
              fontSize: 14
          ),
        ),
        Text(
          'Recovered : ${cases.recovered == 0 ? '-' : cases.recovered}',
          style: blackTextStyle.copyWith(
              fontSize: 14
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          'Deaths : ${cases.deaths == 0 ? '-' : cases.deaths}',
          style: blackTextStyle.copyWith(
              fontSize: 14
          ),
        ),
      ],
    );
  }
}
