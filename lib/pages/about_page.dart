import 'package:covid_app/pages/error_page.dart';
import 'package:covid_app/utils/underedlist_util.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Credit',
                            style: blackTextStyle.copyWith(
                                fontSize: 18
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          UnorderedList([
                            "Pixabay",
                            "Flaticon",
                          ]),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Inspiration',
                            style: blackTextStyle.copyWith(
                                fontSize: 18
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl('https://dribbble.com/shots/14925214-Covid-19-Disease-statistics-Mobile-App');
                            },
                            child:  Text(
                              'Anastasia',
                              style: purpleTextStyle.copyWith(
                                  fontSize: 14
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Source',
                            style: blackTextStyle.copyWith(
                                fontSize: 18
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl('https://kawalcorona.com/api/');
                            },
                            child:  Text(
                              'Kawal Corona API',
                              style: purpleTextStyle.copyWith(
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(
                  height: 70,
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
