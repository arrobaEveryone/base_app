import 'package:flutter/material.dart';

extension ColorExtension on Color{

  Color colorOnBackground({Color darkColor = Colors.black, Color lightColor = Colors.white} ){
    return computeLuminance() > 0.5 ? darkColor : lightColor;
  }

}
