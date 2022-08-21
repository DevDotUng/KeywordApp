class Screenshot {
  Screenshot({
    required this.id,
    required this.role,
    required this.image,
  });

  int id;
  String role;
  String image;

  factory Screenshot.fromJson(Map<String, dynamic> json) {
    return Screenshot(
      id: json['id'] as int,
      role: json['role'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'role': role,
        'image': image,
      };

  String get imageUrl => "http://54.148.218.212:8080/image/screenshot/$image";
}
