class AppInfo {
  AppInfo({
    required this.id,
    required this.name,
    required this.icon,
    required this.category,
    required this.corperation,
  });

  int id;
  String name;
  String icon;
  String category;
  String corperation;

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
      category: json['category'] as String,
      corperation: json['corperation'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'category': category,
        'corperation': corperation,
      };

  String get iconUrl => "http://54.148.218.212:8080/image/icon/$icon";
}
