class SingleJoke {
  SingleJoke({required this.joke});

  factory SingleJoke.fromJson({required Map<String, dynamic> json}) {
    return SingleJoke(joke: json['joke']);
  }

  final String joke;
}
