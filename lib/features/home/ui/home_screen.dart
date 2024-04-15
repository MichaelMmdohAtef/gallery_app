import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/helpers/spacing.dart';
import 'package:gallery_app/features/home/ui/widgets/grid_view_of-image.dart';
import 'package:gallery_app/features/home/ui/widgets/home_bloc_listener.dart';
import 'package:gallery_app/features/home/ui/widgets/logout_and_upload_image_buttons.dart';
import 'package:gallery_app/features/home/ui/widgets/nameAndImageOfUser.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background images/home.png"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              const NameAndImageOfUser(),
              verticalSpace(41),
              const LogOutAndUploadImageButtons(),
              verticalSpace(35),
              const GridViewOfImage(),
              const HomeBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
