import 'package:flutter/material.dart';

class TextUtil {
  static getAdaptiveTextSize(BuildContext context, dynamic size, dynamic length) {
    double value = size;
    if (length > 8) {
      value = (MediaQuery.of(context).size.width / length) - 5;
    }
    return value;
  }
}