import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../data/repository/jokes_data.dart';
import '../../models/single_joke.dart';
import '../../models/two_part_joke.dart';
import '../../routes.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeInitial()) {
    on<GetJokeEvent>((event, emit) async {
      AppNavigator.pushReplace(route: AppRoutes.loadingScreen);
      final joke = await _jokesData.getJokeBycategory(
        category: event.jokeCategory,
      );
      if (joke is SingleJoke) {
        emit(SingleJokeState(joke: joke.joke));
      } else if (joke is TwoPartJoke) {
        emit(TwoPartJokeState(setup: joke.setup, delivery: joke.delivery));
      }
      AppNavigator.pushReplace(route: AppRoutes.jokeScreen);
    });
  }
  final Logger _logger = Logger();
  final JokesData _jokesData = JokesData();
}
