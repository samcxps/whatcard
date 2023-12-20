import 'package:flutter/material.dart';
import 'package:whatcard/theme.dart';

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: WhatCardTheme.of(context).primaryBackground, height: 60);
  }
}
