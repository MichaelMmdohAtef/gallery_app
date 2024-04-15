import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? widthOfIcon;
  final double? heightOfIcon;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final String? backgroundImageIcon;
  final String? iconImage;
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonHeight,
      this.buttonWidth,
      required this.buttonText,
      required this.textStyle,
      required this.onPressed,
      this.backgroundImageIcon,
      this.iconImage,
      this.heightOfIcon,
      this.widthOfIcon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? Colors.transparent,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (iconImage != null || backgroundImageIcon != null)
            Container(
              height: heightOfIcon ?? 29.h,
              width: widthOfIcon ?? 32.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(backgroundImageIcon!),
                      fit: BoxFit.fill)),
              child: iconImage != null
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
                      child: Image.asset(
                        iconImage!,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Container(),
            ),
          Text(
            buttonText,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
