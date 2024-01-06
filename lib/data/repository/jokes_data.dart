import 'package:dio/dio.dart';

import '../../models/error_joke.dart';
import '../../models/single_joke.dart';
import '../../models/two_part_joke.dart';
import '../providers/joke.api.dart';

class JokesData {
  final _jokeApi = JokeApi();

  Future<dynamic> getJokeBycategory({required String category}) async {
    Map<String, String> categoryToUrl = {
      'Any': '/joke/Any?safe-mode',
      'Misc': '/joke/Misc?safe-mode',
      'Programming': '/joke/Programming?safe-mode',
      'Pun': '/joke/Pun?safe-mode',
      'Spooky': '/joke/Spooky?safe-mode',
      'Christmas': '/joke/Christmas?safe-mode',
    };
    try {
      var response = await _jokeApi.getJokeByCategory(
        category: categoryToUrl[category]!,
      );
      if (response.statusCode == 200) {
        if (!response.data['error']) {
          if (response.data['type'] == 'twopart') {
            return TwoPartJoke.fromJson(json: response.data);
          } else {
            return SingleJoke.fromJson(json: response.data);
          }
        } else {
          return ErrorJoke.fromJson(json: response.data);
        }
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return ErrorJoke(message: 'You are not connected to the internet');
      }
      return ErrorJoke(message: e.message.toString());
    } catch (e) {
      return ErrorJoke(message: e.toString());
    }
  }
}
