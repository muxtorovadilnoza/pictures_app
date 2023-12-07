import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import '../model/picturesModel.dart';
const String baseURL = "https://api.pexels.com/";
const String topPhotos = "${baseURL}v1/curated";
const String searchPhotos = "${baseURL}v1/search";
const String key = "563492ad6f917000010000015ec378e9fdc8425b8982a648924f3537";
const int perPage = 50;

class NetworkService {
  static final NetworkService _networkService = NetworkService._internal();

  factory  NetworkService() {
    return _networkService;
  }

  NetworkService._internal();

  final _dio = Dio();

  Future<PhotoResponse?> getPhotosModel() async {
    try {
      var response = await _dio.get(
        topPhotos,
        queryParameters: {
          "page": 1,
          "per_page": perPage,
        },
        options: Options(headers: {
          "Authorization": key,
        }),
      );
      if (response.statusCode == 200) {
        return PhotoResponse.fromJson(response.data);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<PhotoResponse?> searchPhotosModel(String query) async {
    try {
      var response = await _dio.get(
        searchPhotos,
        queryParameters: {
          "per_page": perPage,
          "query": query,
        },
        options: Options(headers: {
          "Authorization": key,
        }),
      );
      if (response.statusCode == 200) {
        return PhotoResponse.fromJson(response.data);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  _saveNetworkImage() async {}

  Future<dynamic> download(String src) async {
    try {
      var response = await _dio.get(src,
          options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: "hello");
      print(result);

      print(src);
      var tempDir = await getTemporaryDirectory();
      String fullPath =
          tempDir.path + "/${src.split("/").last.split("?").first}'";
      print('full path ${fullPath}');
      // var response = await _dio.download(
      //   src,
      //   fullPath,
      // );
      if (response.statusCode == 200) {
        return PhotoResponse.fromJson(response.data);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}