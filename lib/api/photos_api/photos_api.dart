import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_app_bloc/api/api_container.dart';
import 'package:test_app_bloc/models/list_photos_model.dart';
import 'package:test_app_bloc/models/photo_model.dart';

class PhotosApi {
  final ApiContainer _client = ApiContainer();

  Future<List<ListPhotosModel>> getListPhotos() async {
    try {
      Response response = await _client.get(path: '/photos', queryParam: {
        "client_id":
            "ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9"
      });
     List<ListPhotosModel> model = listPhotosModelFromJson(jsonEncode(response.data));
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<PhotoModel> getPhotoById(String id) async{
    try {
      Response response = await _client.get(path: '/photos/$id',  queryParam: {
        "client_id":
            "ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9"
      });
      PhotoModel model = PhotoModel.fromJson(response.data);
      return model;
    } catch (e) {
      throw e;
    }
  }
}
