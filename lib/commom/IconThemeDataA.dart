import 'package:flutter/material.dart';
import 'dart:ui' as ui show lerpDouble;
class IconThemeDataA extends IconThemeData{

  static IconThemeData lerp(IconThemeData? a, IconThemeData? b, double t) {
    assert(t != null);
    return IconThemeData(
      color: Color.lerp(a?.color, b?.color, t),
      opacity: ui.lerpDouble(a?.opacity, b?.opacity, t),
      size: lerpDoubles(a?.size, b?.size, t),
    );
  }

  static IconThemeData lerpColor(IconThemeData? a, IconThemeData? b, double t) {
    assert(t != null);
    return IconThemeData(
      color: Color.lerp(a?.color, b?.color, t),
      opacity: ui.lerpDouble(a?.opacity, b?.opacity, t),
      size: lerpDoubles(a?.size, b?.size, 1),
    );
  }

  //a 未选择 b选择
 static double? lerpDoubles(num? a, num? b, double t) {

     a ??= 0.0;
     b ??= 0.0;
    //0---0.5------1
    //1---0.5------1
    double scale=0;
    if(t==0){
       scale=1;
    }
    if(t>0&&t<=0.5){
      scale=1-t;
    }
    if(t>0.5&&t<=1){
      scale=t;
    }
    return a*scale;
  }
}