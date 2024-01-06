class TwoPartJoke {
  TwoPartJoke({required this.setup, required this.delivery});

  factory TwoPartJoke.fromJson({required Map<String, dynamic> json}) {
    return TwoPartJoke(setup: json['setup'], delivery: json['delivery']);
  }

  final String setup;
  final String delivery;
}
