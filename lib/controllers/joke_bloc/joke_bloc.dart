import 'package:bloc/bloc.dart';
import 'package:eighty_seven_financial_planners_assignment/data/repository/jokes_data.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeInitial()) {
    on<GetJokeEvent>((event, emit) {
      _jokesData.getJokeBycategory(category: event.jokeCategory);
    });
  }
  final Logger _logger = Logger();
  final JokesData _jokesData = JokesData();
}
