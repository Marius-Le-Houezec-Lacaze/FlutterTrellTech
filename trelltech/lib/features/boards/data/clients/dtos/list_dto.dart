

class ListDto {

  final String ? id;
  final String ? name;
  final String ? idBoard;

  ListDto(this.name, this.idBoard, {required this.id});

  static fromJson(Map<String, dynamic> json) => ListDto(
    json['name'] ?? "",
    json['idBoard'] ?? "",
    id: json['id'] ?? "",
  );
}