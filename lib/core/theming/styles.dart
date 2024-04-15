import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/theming/colors.dart';
import 'package:gallery_app/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font50BlackBold = TextStyle(
    fontSize: 50.sp,
    fontFamily: "Segoe",
    height: 1.1,
    color: ColorsManager.mainBlack,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font30BlackBold = TextStyle(
    fontSize: 30.sp,
    fontFamily: "Segoe",
    height: 0.533,
    color: ColorsManager.mainBlack,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font16GreysemiBold = TextStyle(
    fontSize: 16.sp,
    fontFamily: "Segoe",
    height: 1,
    color: ColorsManager.mainBlack,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font18WhitesemiBold = TextStyle(
    fontSize: 18.sp,
    fontFamily: "Segoe",
    height: 0.88,
    color: ColorsManager.mainWhite,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font32BlackBaloosemiBold = TextStyle(
    fontSize: 32.sp,
    fontFamily: "Baloo",
    height: 1.28,
    color: ColorsManager.mainBlack,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font20BlackBaloosemiBold = TextStyle(
    fontSize: 20.sp,
    fontFamily: "Baloo",
    height: 1.25,
    color: ColorsManager.mainBlack,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font27BlackBold = TextStyle(
    fontSize: 27.sp,
    fontFamily: "Segoe",
    height: 2.185,
    color: ColorsManager.mainBlack,
    fontWeight: FontWeightHelper.bold,
  );
}
