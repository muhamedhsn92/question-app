import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://zad-solution.xyz/api/zad-pos-inventory-backend/',
        // baseUrl: 'https://bing-news-search1.p.ra pidapi.com/news/trendingtopics',
        // baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    @required dynamic query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
