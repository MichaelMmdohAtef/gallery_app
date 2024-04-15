import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/helpers/extensions.dart';
import 'package:gallery_app/core/routing/routes.dart';
import 'package:gallery_app/core/theming/styles.dart';
import 'package:gallery_app/core/widgets/app_text_button.dart';
import 'package:gallery_app/core/widgets/frosted_glass_box.dart';
import 'package:gallery_app/features/home/ui/widgets/dialog_of_gallery_and_camera.dart';

class LogOutAndUploadImageButtons extends StatelessWidget {
  const LogOutAndUploadImageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FrostedGlassBox(
            borderRadius: 16,
            height: 40.h,
            width: 145.w,
            child: AppTextButton(
                horizontalPadding: 0,
                verticalPadding: 0,
                buttonText: "log out",
                iconImage: "assets/images/logoutIcon.png",
                backgroundImageIcon:
                    "assets/background images/redBackground.png",
                textStyle: TextStyles.font20BlackBaloosemiBold,
                onPressed: () {
                  context.pushNamedAndRemoveUntil(context,Routes.loginScreen,
                      predicate: (route) => false);
                }),
          ),
          FrostedGlassBox(
            borderRadius: 16,
            height: 40.h,
            width: 145.w,
            child: AppTextButton(
                horizontalPadding: 0,
                verticalPadding: 0,
                iconImage: "assets/images/uploadIcon.png",
                backgroundImageIcon:
                    "assets/background images/yellowBackground.png",
                buttonText: "upload",
                textStyle: TextStyles.font20BlackBaloosemiBold,
                onPressed: () => uploadIMageFromGallery(context)),
          ),
        ],
      ),
    );
  }

  uploadIMageFromGallery(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) =>const DialogOfGalleryAndCamera());
  }
}
