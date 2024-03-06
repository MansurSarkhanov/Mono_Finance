import 'package:flutter/material.dart';

double mediaQuery(context, {double? height}) {
  return MediaQuery.of(context).size.height * (height ?? 1);
}
