import 'package:covid_app/models/global_attribute.dart';
import 'package:covid_app/models/province_attribute.dart';
import 'package:covid_app/providers/covid_provider.dart';
import 'package:covid_app/widgets/indonesia_card.dart';
import 'package:covid_app/widgets/worldwide_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class DetailPage extends StatelessWidget {

  final int id;

  DetailPage(this.id);

  @override
  Widget build(BuildContext context) {

    var covidProvider = Provider.of<CovidProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/cover.png',
              width: MediaQuery.of(context).size.width,
              height: 150,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 128,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20)
                      ),
                      color: whiteColor
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: edge,
                    ),
                    child: FutureBuilder(
                      future: (id == 0) ? covidProvider.getProvinceCases() : covidProvider.getGlobalCases(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {

                          if (id == 0) {
                            List<ProvinceAttribute> data = new List<ProvinceAttribute>.from(snapshot.data as List);

                            int index = 0;
                            return  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: data.map((item) {
                                index++;
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: index == 1 ? 30 : 30,
                                  ),
                                  child: IndonesiaCard(item.province),
                                );
                              }).toList(),
                            );
                          } else {
                            List<GlobalAttribute> data = new List<GlobalAttribute>.from(snapshot.data as List);

                            int index = 0;
                            return  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: data.map((item) {
                                index++;
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: index == 1 ? 30 : 30,
                                  ),
                                  child: WorldwideCard(item.global),
                                );
                              }).toList(),
                            );
                          }
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: edge,
                  vertical: 30
              ),
              child:  Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                        'assets/images/btn_back.png',
                        width: 40
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
