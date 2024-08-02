

class Pokemon {
  final String name;
  final String image;
  final String num;
  final List<String> type;
  final int id;
  final String height;
  final String? weight;
  final List<String> weaknesses;

  Pokemon({
    required this.weaknesses, 
    required this.name,
    required this.image,
    required this.num,
    required this.type,
    required this.id,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
        weaknesses: List<String>.from(json['weaknesses']),
        name: json['name'],
        image: json['img'],
        num: json['num'],
        type: (json['type'] as List<dynamic>)
            .map(
              (e) => e as String,
            )
            .toList(),
        id: json['id'],
        height: json['height'],
        weight: json['weight'] ?? ''
        );
        
       
  }
}
