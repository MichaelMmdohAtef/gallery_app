// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGalleryModel _$GetGalleryModelFromJson(Map<String, dynamic> json) =>
    GetGalleryModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ListOfImages.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetGalleryModelToJson(GetGalleryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ListOfImages _$ListOfImagesFromJson(Map<String, dynamic> json) => ListOfImages()
  ..images = (json['images'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$ListOfImagesToJson(ListOfImages instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
