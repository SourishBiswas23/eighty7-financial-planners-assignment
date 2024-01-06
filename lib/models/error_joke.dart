class ErrorJoke {
  ErrorJoke({required this.message});

  factory ErrorJoke.fromJson({required Map<String, dynamic> json}) {
    return ErrorJoke(message: json['message']);
  }

  final String message;
}
