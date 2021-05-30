import 'package:covid_app/models/indonesia_case.dart';
import 'package:covid_app/models/info.dart';
import 'package:covid_app/pages/detail_page.dart';
import 'package:covid_app/providers/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class InfoCard extends StatelessWidget {
  final Info info;

  InfoCard(this.info);

  @override
  Widget build(BuildContext context) {

    var covidProvider = Provider.of<CovidProvider>(context);

    moveToDetail(int id) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetailPage(id),
      ));
    }

    return Row(
      children: [
        Image.asset(
          info.imageUrl,
          width: 50,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info.title,
              style: blackTextStyle.copyWith(
                  fontSize: 18
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
                child: FutureBuilder(
                  future: info.id == 0 ? covidProvider.getIndonesiaCases() : covidProvider.getGlobalPositive(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String totalCases = "-";

                      if (info.id == 0) {
                        List<IndonesiaCase> data = new List<IndonesiaCase>.from(snapshot.data as List);
                        totalCases = data[0].positif;
                      } else {
                        totalCases = snapshot.data as String;
                      }

                      return  Text(
                        '${totalCases} total positive cases ',
                        style: greyTextStyle,
                      );
                    }

                    return Text(
                      '- total positive cases ',
                      style: greyTextStyle,
                    );
                  },
                )
            ),
          ],
        ),
        Spacer(),
        IconButton(
            onPressed: (){
              moveToDetail(info.id);
            },
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            )
        )
      ],
    );
  }
}
