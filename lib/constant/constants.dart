import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = "Pokedex";
  static TextStyle getTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontSize: _calculateFontSize(48),
        fontWeight: FontWeight.bold);
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontSize: _calculateFontSize(
            ScreenUtil().orientation == Orientation.portrait ? 20 : 16),
        fontWeight: FontWeight.bold);
  }

  static TextStyle getTypeChipTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(
          ScreenUtil().orientation == Orientation.portrait ? 20 : 12),
    );
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.8).sp;
    }
  }

  static getPokeInfoLabelTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: _calculateFontSize(
            ScreenUtil().orientation == Orientation.portrait ? 20 : 13),
        fontWeight: FontWeight.bold);
  }

  static getPokeInfoTextStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: _calculateFontSize(
          ScreenUtil().orientation == Orientation.portrait ? 16 : 10),
    );
  }
}
