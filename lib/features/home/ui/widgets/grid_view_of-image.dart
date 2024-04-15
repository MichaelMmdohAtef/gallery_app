import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/theming/colors.dart';
import 'package:gallery_app/features/home/logic/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/ui/widgets/cach_images.dart';

class GridViewOfImage extends StatelessWidget {
  const GridViewOfImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          await BlocProvider.of<HomeCubit>(context).emitGetImages();
        },
        child: ConditionalBuilder(
            condition: BlocProvider.of<HomeCubit>(context, listen: true)
                    .galleryModel !=
                null,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Stack(
                  children: [
                    GridView.count(
                      crossAxisCount: 3,
                      physics: const BouncingScrollPhysics(),
                      crossAxisSpacing: 24.w,
                      mainAxisSpacing: 25.h,
                      shrinkWrap: true,
                      children: List.generate(
                          BlocProvider.of<HomeCubit>(context, listen: true)
                              .galleryModel!
                              .data!
                              .images
                              .length,
                          (index) => Container(
                              height: 108.h,
                              width: 108.w,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: ColorsManager.mainWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                      blurStyle: BlurStyle.normal,
                                      color:
                                          const Color(0xff000000).withAlpha(25),
                                    )
                                  ]),
                              child: CachImages(
                                image: BlocProvider.of<HomeCubit>(context,
                                        listen: true)
                                    .galleryModel!
                                    .data!
                                    .images[index],
                              ))),
                    ),
                  ],
                ),
              );
            },
            fallback: (context) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                )),
      ),
    );
  }
}
