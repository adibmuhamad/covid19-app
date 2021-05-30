import 'dart:convert';

import 'package:covid_app/models/global_attribute.dart';
import 'package:covid_app/models/province_attribute.dart';
import 'package:covid_app/models/global_cases.dart';
import 'package:covid_app/models/indonesia_case.dart';
import 'package:covid_app/models/province_cases.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidProvider extends ChangeNotifier {
  getIndonesiaCases() async {
    var url = Uri.parse('https://api.kawalcorona.com/indonesia');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<IndonesiaCase> cases = data.map((item) => IndonesiaCase.fromJson(item)).toList();
      return cases;
    } else {
      return [];
    }
  }

  getProvinceCases() async {
    var url = Uri.parse('https://api.kawalcorona.com/indonesia/provinsi');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<ProvinceAttribute> attr = data.map((item) => ProvinceAttribute.fromJson(item)).toList();
      return attr;
    } else {
      return <ProvinceCases>[];
    }
  }

  getGlobalCases() async {
    var url = Uri.parse('https://api.kawalcorona.com/');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<GlobalAttribute> attr = data.map((item) => GlobalAttribute.fromJson(item)).toList();
      return attr;
    } else {
      return <GlobalCases>[];
    }
  }

  getGlobalPositive() async {
    var url = Uri.parse('https://api.kawalcorona.com/positif');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      var name = data['value'];
      return name;
    } else {
      return '-';
    }
  }

  getGlobalRecover() async {
    var url = Uri.parse('https://api.kawalcorona.com/sembuh');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      var name = data['value'];
      return name;
    } else {
      return 0;
    }
  }

  getGlobalDeath() async {
    var url = Uri.parse('https://api.kawalcorona.com/meninggal');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      var name = data['value'];
      return name;
    } else {
      return 0;
    }
  }


}