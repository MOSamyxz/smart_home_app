
import 'package:flutter/material.dart';

class AppSize {
  static const double padding = 16.0;
  static const double borderRadius = 12.0;
  static const double buttonHeight = 48.0;
  static const double textFieldHeight = 56.0;
  static const EdgeInsets defaultPadding = EdgeInsets.all(padding);
  static const EdgeInsets smallPadding = EdgeInsets.all(padding / 2);
  static const EdgeInsets largePadding = EdgeInsets.all(padding * 2);
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: padding);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: padding);
  static const EdgeInsets symmetricPadding = EdgeInsets.symmetric(horizontal: padding, vertical: padding - 2);
  static const double iconSize = 24.0;
 
 static  Widget verticalSpacer (height){
    return SizedBox(height: height);
 }
  static  Widget horizontalSpacer (width){
      return SizedBox(width: width);
    }
}
