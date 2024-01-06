part of 'joke_bloc.dart';

@immutable
sealed class JokeState {}

final class JokeInitial extends JokeState {}

class SingleJokeState extends JokeState {
  SingleJokeState({required this.joke});
  final String joke;
}

class TwoPartJokeState extends JokeState {
  TwoPartJokeState({required this.setup, required this.delivery});
  final String setup;
  final String delivery;
}

class ErrorJokeState extends JokeState {
  ErrorJokeState({required this.message});
  final String message;
}
