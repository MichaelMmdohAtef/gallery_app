// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/theming/styles.dart';

class NameAndImageOfUser extends StatelessWidget {
  const NameAndImageOfUser({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 27.w,
                    top: 35.h,
                  ),
                  child: SizedBox(
                    height: 91.h,
                    width: 142.w,
                    child: Text(
                      "Welcome Mina",
                      style: TextStyles.font32BlackBaloosemiBold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: 32.w,
                    top: 26.h,
                  ),
                  child: Container(
                    height: 66.h,
                    width: 66.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/Ellipse 1641.png"),
                            fit: BoxFit.fill)),
                  ),
                ),
              ],
            );
  }
}