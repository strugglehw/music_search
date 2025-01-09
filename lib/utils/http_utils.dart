import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:music_search/model/fetch_response.dart';

const String url =
    "https://itunes.apple.com/search?term=Talyor+Swift&limit=200&media=music";

///网络工具类
class HttpUtils {
  static final HttpUtils _httpUtils = HttpUtils._internal();
  late Dio _dio;
  HttpUtils._internal() {
    _dio = Dio();
  }
  static HttpUtils instance() {
    return _httpUtils;
  }

  Future<FetchResponse?> fetchData() async {
    Response response = await _dio.get(url);
    var data = response.data;
    if (data is String) {
      var dataObj = jsonDecode(data);
      if (dataObj is Map) {
        return FetchResponse.fromJson(dataObj as Map<String, dynamic>);
      }
    } else if (data is Map) {
      return FetchResponse.fromJson(data as Map<String, dynamic>);
    }
    return null;
  }
}
