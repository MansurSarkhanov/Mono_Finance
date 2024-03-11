import 'package:flutter/material.dart';

void createPageRoute(context, Widget child) {
  Navigator.of(context).pushReplacement(PageRouteBuilder(
    pageBuilder: (_, __, ___) => child,
    transitionDuration: const Duration(seconds: 2),
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    ),
  );
}
