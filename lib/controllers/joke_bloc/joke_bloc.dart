import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeInitial()) {
    on<GetJokeEvent>((event, emit) {
      _logger.i(event.jokeType);
    });
  }
  final Logger _logger = Logger();
}
