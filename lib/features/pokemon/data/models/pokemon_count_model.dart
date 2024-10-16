class PokemonCountModel {
  final int count;

  PokemonCountModel({
    required this.count,
  });

  factory PokemonCountModel.fromJson(Map<String, dynamic> json) {
    return PokemonCountModel(
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'count': count};
  }
}
