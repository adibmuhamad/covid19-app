import 'package:covid_app/models/indonesia_case.dart';
import 'package:covid_app/models/info.dart';
import 'package:covid_app/pages/about_page.dart';
import 'package:covid_app/pages/error_page.dart';
import 'package:covid_app/providers/covid_provider.dart';
import 'package:covid_app/utils/text_util.dart';
import 'package:covid_app/widgets/bottom_navbar.dart';
import 'package:covid_app/widgets/info_card.dart';
import 'package:covid_app/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';
import 'banner_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var covidProvider = Provider.of<CovidProvider>(context);

    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
//        throw(url);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ErrorPage(),
        ));
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // NOTE : Cover Image
            Image.asset(
              "assets/images/thumbnail.png",
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            // NOTE : Main Contain
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20)
                      ),
                      color: whiteColor
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Column(
                          children: [
                            InfoCard(
                                Info(
                                    id: 0,
                                    title: 'Indonesia',
                                    imageUrl: 'assets/images/indonesia_flag.png'
                                )
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InfoCard(
                                Info(
                                    id: 1,
                                    title: 'Worldwide',
                                    imageUrl: 'assets/images/world.png'
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // NOTE : Tips
                Padding(
                  padding: EdgeInsets.only(
                    left: edge,
                  ),
                  child: Text(
                    'Don\'t forget',
                    style: regularTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: edge
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TipCard(
                          imageUrl: 'assets/images/wear_mask.png',
                          desc: 'Wear Mask',
                        ),
                        TipCard(
                          imageUrl: 'assets/images/wash_hand.png',
                          desc: 'Wash Hand',
                        ),
                        TipCard(
                          imageUrl: 'assets/images/social_distancing.png',
                          desc: 'Social DIstancing',
                        ),
                      ]
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => BannerPage(),
                    )
                    );
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: edge
                      ),
                      child:  ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 130,
                          child: Image.asset(
                            'assets/images/banner.png',
                            height: 130,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(
                  height: 80 + edge,
                ),
              ],
            ),
            // NOTE : Cover Text
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: FutureBuilder(
                      future: covidProvider.getIndonesiaCases(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<IndonesiaCase> data = new List<IndonesiaCase>.from(snapshot.data as List);

                          return Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Text(data[0].positif,
                                  style: whiteTextStyle.copyWith(
                                      fontSize: TextUtil.getAdaptiveTextSize(context, 50.0, data[0].positif.length)
                                  )),
                              Text('Total Cases',
                                  style: whiteLightTextStyle.copyWith(
                                      fontSize: 18
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Text('${data[0].sembuh} total recovered',
                                  style: whiteLightTextStyle.copyWith(
                                      fontSize: 14
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text('${data[0].meninggal} total deaths',
                                  style: whiteLightTextStyle.copyWith(
                                      fontSize: 14
                                  )),
                            ],
                          );
                        }

                        return Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text("-",
                                style: whiteTextStyle.copyWith(
                                    fontSize: 50
                                )),
                            Text('Total Cases',
                                style: whiteLightTextStyle.copyWith(
                                    fontSize: 16
                                )),
                          ],
                        );
                      },
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
            horizontal: edge
        ),
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbar(
              imageUrl: 'assets/images/icon_home',
              isActive: true,
            ),
            InkWell(
              onTap: (){
                launchUrl('https://covid19.go.id/tanya-jawab');
              },
              child:  BottomNavbar(
                imageUrl: 'assets/images/icon_faq',
                isActive: false,
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ));
              },
              child:  BottomNavbar(
                imageUrl: 'assets/images/icon_about',
                isActive: false,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
