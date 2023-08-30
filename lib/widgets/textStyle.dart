import 'package:flutter/material.dart';

TextStyle textStyle1() {
  return const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle textStyle3() {
  return const TextStyle(fontSize: 25, fontWeight: FontWeight.w500);
}

TextStyle textStyle2() {
  return const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
}

TextStyle textStyleCustom(fontSize, fontWeight) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight);
}
