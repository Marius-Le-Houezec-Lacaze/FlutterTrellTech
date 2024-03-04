

class BoardsDto {

  final String ? id;
  final String ? name;
  final String ? description;

  BoardsDto(this.name, this.description, {required this.id});

  static fromJson(Map<String, dynamic> json) => BoardsDto(
    json['name'] ?? "",
    json['description'] ?? "",
    id: json['id'] ?? "",
  );
}