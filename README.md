# COVID-19 APP
 
A simple application to ge information total cases in Indonesia and worldwide using Flutter!

Ilustration [Dribbble](https://dribbble.com/shots/15750085-COVID-19-APP)

## Features

1. Get cases in indonesia and each provinces
2. Get cases in worldwide

## Supported Device

- Android device with minimum API 16 **(Jelly Bean)**

## Build App requirements

- Recommended using Flutter 2.2.1 in this [Stable channel](https://github.com/flutter/flutter.git)
- Using Dart v2.13.1

## Instructions

1. Clone from this repository
   - Copy repository url
   - Open your fav code editor _(Recommended using Android Studio)_
   - New -> Project from Version Control..
   - Paste the url, click OK
2. Run "flutter pub get" in the project directory or click the highlighted instruction in Android Studio
3. Prepare the Android Virtual Device or real device 
4. Run main.dart

## Code Design & Structure

This project directory consist of 5 directories:
1. **Model**: consists models or data structure that being used in the project
   - `global_attribute`: provide the model to parse JSON attribute on API
   - `global_cases`: provide the model to parse JSON from attribute to object global cases
   - `indonesia_case`: provide the model to parse JSON indonesia cases API
   - `info`: provide the model for widget card info 
   - `province_attribute`: provide the model to parse JSON attribute on API
   - `province_cases`: provide the model to parse JSON from attribute to object provinces cases
2. **Pages**: consists page that shown to the user
   - `about_page`: provide the about/credit screen for the components and declare the basic functional
   - `banner_page`:  provide the detail banner info screen for the components and declare the basic functional
   - `detail_page`: provide the detail cases screen for the components and declare the basic functional
   - `error_page`:  provide the error screen for the components and declare the basic functional
   - `home_page`:  provide the main screen for the components and declare the basic functional
   - `splash_page`:  provide the splash screen for the components and declare the basic functional
3. **Providers**: consists class to consume API
   - `covid_provider`: provide the class to consume [Kawal Corona API](https://kawalcorona.com/api/) 
4. **Utils**: consists tools that support the component's function
   - `text_util`: function to resize font size depend on width screen and text length
   - `inderedlist_util`: function to support bullet numbering test
5. **Widgets**: consists widgets that build the screen and do it's function
   - `bottom_button`: widget that provide custom bottom buttom 
   - `bottom_navbar`: widget that provide custom bottom navigation
   - `indonesia_card`: widget that provide card for indonesia detail screens 
   - `info_card`: widget that provide card for info screens 
   - `tips_card`:  widget that provide card for tips screens  
   - `worldwide_card`: widget that provide card for worldwide detail screens 

## API

API that use in this project : [Kawal Corona API](https://kawalcorona.com/api/) 

## Credit

- Pixabay
- Flaticon

## Inspiration

Dribbble [Anastasia](https://dribbble.com/shots/14925214-Covid-19-Disease-statistics-Mobile-App)
