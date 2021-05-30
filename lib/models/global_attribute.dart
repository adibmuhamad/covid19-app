import 'package:covid_app/models/global_cases.dart';

class GlobalAttribute {
  GlobalCases global;

  GlobalAttribute({required this.global});

  factory GlobalAttribute.fromJson(Map<String, dynamic> json) {
    return GlobalAttribute(
        global: parseAttributes(json)
    );
  }

  static GlobalCases parseAttributes(attributeJson) {
    var attr = attributeJson['attributes'];
    print(attr);
    return GlobalCases.fromJson(attr);
  }


}