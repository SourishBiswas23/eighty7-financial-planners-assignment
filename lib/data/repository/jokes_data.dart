import 'package:eighty_seven_financial_planners_assignment/data/providers/joke.api.dart';
import 'package:logger/logger.dart';

class JokesData {
  final _jokeApi = JokeApi();
  final _logger = Logger();

  getJokeBycategory({required String category}) async {
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
    _logger.i(response.data);
    return response;
  }
}
