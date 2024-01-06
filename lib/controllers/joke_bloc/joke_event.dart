part of 'joke_bloc.dart';

@immutable
sealed class JokeEvent {}

class GetJokeEvent extends JokeEvent {
  GetJokeEvent({required this.jokeType});
  final String jokeType;
}
