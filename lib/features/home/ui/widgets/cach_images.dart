import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CachImages extends StatelessWidget {
  CachImages({super.key, required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      alignment: Alignment.center,
      errorWidget: (context, string, obj) {
        return const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
        );
      },
      fit: BoxFit.cover,
    );
  }
}
