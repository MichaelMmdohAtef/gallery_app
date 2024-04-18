import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/helpers/spacing.dart';
import 'package:gallery_app/core/theming/styles.dart';
import 'package:gallery_app/features/login/ui/widgets/email_and_password.dart';
import 'package:toast/toast.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 1.sh,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background images/log in.png"),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 41.w,
                end: 42.w,
                top: 206.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 122.h,
                    width: 174.w,
                    child: Text(
                      'My Gellary',
                      textAlign: TextAlign.center,
                      style: TextStyles.font50BlackBold,
                    ),
                  ),
                  verticalSpace(40),
                  const EmailAndPassword(),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
