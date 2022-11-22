// {
//  "name": "Open Graph Test User",
//  "email": "open_jygexjs_user@tfbnw.net",
//  "picture": {
//    "data": {
//      "height": 126,
//      "url": "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/8462.jpg",
//      "width": 200
//    }
//  },
//  "id": "136742241592917"
// }
import 'package:flutter/foundation.dart';

class FacebookModel {
  final String? name;
  final String? email;
  final String? id;
  final FaceBookPhotoModel? faceBookPhotoModel;

  FacebookModel({this.name, this.email, this.id, this.faceBookPhotoModel});

  factory FacebookModel.fromJson(Map<String, dynamic> json) => FacebookModel(
      email: json['email'],
      name: json['name'],
      id: json['id'],
      faceBookPhotoModel: FaceBookPhotoModel.fromJson(json['picture']['data']));
}

class FaceBookPhotoModel {
  final String? url;
  final int? width;
  final int? hight;

  FaceBookPhotoModel({this.url, this.width, this.hight});
  factory FaceBookPhotoModel.fromJson(Map<String, dynamic> json) =>
      FaceBookPhotoModel(
          url: json['url'], width: json['width'], hight: json['height']);
}
