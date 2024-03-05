

class BoardDto {

  final String ? id;
  final String ? name;
  final String ? description;

  BoardDto(this.name, this.description, {required this.id});

  static fromJson(Map<String, dynamic> json) => BoardDto(
    json['name'] ?? "",
    json['description'] ?? "",
    id: json['id'] ?? "",
  );
}