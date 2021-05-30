
import 'package:covid_app/utils/underedlist_util.dart';
import 'package:covid_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class BannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/banner.png',
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
                          'Self care',
                          style: blackTextStyle.copyWith(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'After exposure to someone who has COVID-19, do the following',
                          style: blackTextStyle.copyWith(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        UnorderedList([
                          "Call your health care provider or COVID-19 hotline to find out where and when to get a test.",
                          "Cooperate with contact-tracing procedures to stop the spread of the virus.",
                          "If testing is not available, stay home and away from others for 14 days.",
                          "While you are in quarantine, do not go to work, to school or to public places. Ask someone to bring you supplies.",
                          "Keep at least a 1-metre distance from others, even from your family members.",
                          "Wear a medical mask to protect others, including if/when you need to seek medical care.",
                          "Clean your hands frequently.",
                          "Stay in a separate room from other family members, and if not possible, wear a medical mask.",
                          "Keep the room well-ventilated.",
                          "If you share a room, place beds at least 1 metre apart.",
                          "Monitor yourself for any symptoms for 14 days.",
                          "Call your health care provider immediately if you have any of these danger signs: difficulty breathing, loss of speech or mobility, confusion or chest pain.",
                          "Stay positive by keeping in touch with loved ones by phone or online, and by exercising at home."
                        ]),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Medical treatments',
                          style: blackTextStyle.copyWith(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Scientists around the world are working to find and develop treatments for COVID-19',
                          style: blackTextStyle.copyWith(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        UnorderedList([
                          "Optimal supportive care includes oxygen for severely ill patients and those who are at risk for severe disease and more advanced respiratory support such as ventilation for patients who are critically ill.",
                          "Dexamethasone is a corticosteroid that can help reduce the length of time on a ventilator and save lives of patients with severe and critical illness.",
                        ]),
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
      floatingActionButton: Container(
        height: 40,
        width: 100,
        margin: EdgeInsets.symmetric(
            horizontal: edge
        ),
        decoration: BoxDecoration(
          color: redColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: BottomButton(
          title: 'more info',
          url: 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/coronavirus-disease-covid-19#:~:text=treatment',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
