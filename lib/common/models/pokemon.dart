class Pokemon {
  final String name;
  final String image;
  final String num;
  final List<String> type;
  final int id;

  Pokemon({
    required this.name,
    required this.image,
    required this.num,
    required this.type,
    required this.id,
  });

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
        name: json['name'],
        image: json['img'],
        num: json['num'],
        type: (json['type'] as List<dynamic>)
            .map(
              (e) => e as String,
            )
            .toList(),
        id: json['id']);
  }
}
