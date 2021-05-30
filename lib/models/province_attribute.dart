import 'package:covid_app/models/province_cases.dart';

class ProvinceAttribute {
  ProvinceCases province;

  ProvinceAttribute({required this.province});

  factory ProvinceAttribute.fromJson(Map<String, dynamic> json) {
    return ProvinceAttribute(
        province: parseAttributes(json)
    );
  }

  static ProvinceCases parseAttributes(attributeJson) {
    var attr = attributeJson['attributes'];
    return ProvinceCases.fromJson(attr);
  }


}