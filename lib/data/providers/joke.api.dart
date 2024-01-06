import 'package:dio/dio.dart';

class JokeApi {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://v2.jokeapi.dev/'));

  Future<Response> getJokeByCategory({required String category}) async {
    final response = await _dio.get(category);
    return response;
  }
}
