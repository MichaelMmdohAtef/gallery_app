import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/di/dependency_injection.dart';
import 'package:gallery_app/core/helpers/spacing.dart';
import 'package:gallery_app/core/theming/colors.dart';
import 'package:gallery_app/core/theming/styles.dart';
import 'package:gallery_app/core/widgets/app_text_button.dart';
import 'package:gallery_app/core/widgets/frosted_glass_box.dart';
import 'package:gallery_app/features/home/data/repos/home_repo.dart';
import 'package:gallery_app/features/home/logic/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/ui/widgets/home_bloc_listener.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class DialogOfGalleryAndCamera extends StatelessWidget {
  const DialogOfGalleryAndCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>()),
      child: Builder(builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: FrostedGlassBox(
            height: 270.h,
            width: 353.w,
            borderRadius: 32,
            borderWidth: 1,
            amount: 10,
            brightness: 0.5,
            colorOfButton: ColorsManager.mainWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FrostedGlassBox(
                  height: 65.h,
                  width: 184.w,
                  borderRadius: 20,
                  colorOfButton: ColorsManager.mainOffWhite,
                  child: AppTextButton(
                      buttonText: "Gellary",
                      textStyle: TextStyles.font27BlackBold,
                      buttonWidth: 184.w,
                      heightOfIcon: 58.h,
                      widthOfIcon: 57.w,
                      backgroundImageIcon: "assets/images/gallery.png",
                      horizontalPadding: 0,
                      verticalPadding: 0,
                      buttonHeight: 65.h,
                      borderRadius: 20,
                      onPressed: () async {
                        File? filePath = await pickImageFromGallery();
                        if (filePath != null) {
                          FormData formData =
                              await convertImageToFormData(filePath.path);
                          await HomeCubit.get(context)
                              .emitUploadImage(formData);
                        }
                      }),
                ),
                verticalSpace(44.h),
                FrostedGlassBox(
                  height: 65.h,
                  width: 184.w,
                  borderRadius: 20,
                  colorOfButton: ColorsManager.secondWhite,
                  child: AppTextButton(
                      buttonText: "Camera",
                      textStyle: TextStyles.font27BlackBold,
                      buttonWidth: 184.w,
                      widthOfIcon: 57.w,
                      heightOfIcon: 58.h,
                      backgroundImageIcon: "assets/images/camera.png",
                      horizontalPadding: 0,
                      verticalPadding: 0,
                      buttonHeight: 65.h,
                      borderRadius: 20,
                      onPressed: () async {
                        File? filePath = await pickImageFromCamera();
                        if (filePath != null) {
                          FormData formData =
                              await convertImageToFormData(filePath.path);
                          await HomeCubit.get(context)
                              .emitUploadImage(formData);
                        }
                      }),
                ),
                const HomeBlocListener(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<File?> pickImageFromGallery() async {
    try {
      // ignore: invalid_use_of_visible_for_testing_member
      final XFile? image = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.gallery);
      return File(image!.path);
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<File?> pickImageFromCamera() async {
    try {
      // ignore: invalid_use_of_visible_for_testing_member
      final XFile? image = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.camera);
      return File(image!.path);
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<FormData> convertImageToFormData(String pathOfImage) async {
    var formData = FormData.fromMap({
      "img": await MultipartFile.fromFile(pathOfImage,
          contentType: MediaType("multipart/*", "text/plain")),
    });
    return formData;
  }
}
