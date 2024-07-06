class Destination {
  final String name;
  final String description;
  final List<dynamic> images;

  Destination({
    required this.name,
    required this.description,
    required this.images,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      name: json['name'],
      description: json['description'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'images': images,
    };
  }
}