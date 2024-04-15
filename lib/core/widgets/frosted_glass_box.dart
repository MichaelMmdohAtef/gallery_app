import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FrostedGlassBox extends StatelessWidget {
  FrostedGlassBox(
      {super.key,
      required this.borderRadius,
      required this.height,
      required this.width,
      required this.child,
      this.brightness,
      this.amount,
      this.borderWidth});
  double borderRadius;
  double height;
  double width;
  Widget child;
  double? brightness;
  double? amount;
  double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: amount ?? 10,
                sigmaY: amount ?? 10,
              ),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(brightness ?? 0.5),
                      Colors.white.withOpacity(brightness ?? 0.5),
                    ],
                  )),
            ),
            Center(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
