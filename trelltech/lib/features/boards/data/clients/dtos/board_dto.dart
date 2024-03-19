

class BoardDto {

  final String ? id;
  final String ? name;
  final String ? description;
  final String ? idBoardSource;
  final String ? idOrganization;
  final String ? backgroundImage;

  BoardDto(this.backgroundImage, this.name, this.description,this.idBoardSource,this.idOrganization, {required this.id});

  static fromJson(Map<String, dynamic> json) => BoardDto(
    json['prefs']['backgroundImage'] ?? "",
    json['name'] ?? "",
    json['description'] ?? "",
    json['idBoardSource'] ?? "",
    json['idOrganization'] ?? "",
    id: json['id'] ?? "",
  );
}