import 'dart:convert';

import 'package:gallery_app/core/helpers/cach_helper.dart';
import 'package:gallery_app/features/home/data/models/get_gallery_model.dart';

const cachedImage = 'Cach_Image';

class GetImagesLocalDataSource {
  CachHelper cachHelper = CachHelper();

  Future<GetGalleryModel?> getImageFromLocalData() async {
    final jsonString = await cachHelper.getData(key: cachedImage);

    if (jsonString != null) {
      return Future.value(GetGalleryModel.fromJson(json.decode(jsonString)));
    }
    return null;
  }

  Future<void> cacheImages({required GetGalleryModel imagesToCach}) async {
    return await cachHelper.putData(
      key: cachedImage,
      value: json.encode(
        imagesToCach.toJson(),
      ),
    );
  }
}
