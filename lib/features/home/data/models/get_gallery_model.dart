import 'package:json_annotation/json_annotation.dart';

part 'get_gallery_model.g.dart';

@JsonSerializable()
class GetGalleryModel {
  String? status;
  String? message;
  ListOfImages? data;

  GetGalleryModel({this.status, this.message, this.data});

  factory GetGalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GetGalleryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetGalleryModelToJson(this);
}

@JsonSerializable()
class ListOfImages {
  List<String> images = [];

  ListOfImages();

  factory ListOfImages.fromJson(Map<String, dynamic> json) =>
      _$ListOfImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfImagesToJson(this);      
}
