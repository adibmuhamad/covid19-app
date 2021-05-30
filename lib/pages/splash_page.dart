import 'package:covid_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/coronavirus.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/coronavirus.png',
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  left: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Wear a mask\nsave lives',
                      style: whiteTextStyle.copyWith(
                          fontSize: 24
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'By wearing a mask you’re stopping the spread and protecting others',
                      style: whiteLightTextStyle.copyWith(
                          fontSize: 14
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 210,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          );
                        },
                        color: primaryColor,
                        child: Text(
                          'More Info',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
