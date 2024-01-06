import 'package:eighty_seven_financial_planners_assignment/data/providers/joke.api.dart';
import 'package:eighty_seven_financial_planners_assignment/models/single_joke.dart';
import 'package:eighty_seven_financial_planners_assignment/models/two_part_joke.dart';
import 'package:logger/logger.dart';

class JokesData {
  final _jokeApi = JokeApi();
  final _logger = Logger();

  Future<dynamic> getJokeBycategory({required String category}) async {
    Map<String, String> categoryToUrl = {
      'Any': '/joke/Any',
      'Misc': '/joke/Misc',
      'Programming': '/joke/Programming',
      'Pun': '/joke/Pun',
      'Spooky': '/joke/Spooky',
      'Christmas': '/joke/Christmas',
    };
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
      }
    }
    return response.data;
  }
}
