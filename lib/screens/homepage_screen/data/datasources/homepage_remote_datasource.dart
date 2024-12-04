import 'dart:convert';

import 'package:inventi_coding_exam/screens/homepage_screen/data/exceptions/exceptions.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/model/homepage_model.dart';
import 'package:dio/dio.dart';
import 'package:inventi_coding_exam/utils/api_constants/api_constants.dart';

abstract class HomePageRemoteDataSource {
  Future<HomePageModel> getRandomString();
}

class HomePageRemoteDataSourceImpl implements HomePageRemoteDataSource {
  HomePageRemoteDataSourceImpl({required this.dio});
  final Dio dio;
  @override
  Future<HomePageModel> getRandomString() async {
    final response = await dio.get(baseURL);
    if (response.statusCode == 200) {
      final responseBody = jsonEncode(response.data);
      return HomePageModelMapper.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }
}
