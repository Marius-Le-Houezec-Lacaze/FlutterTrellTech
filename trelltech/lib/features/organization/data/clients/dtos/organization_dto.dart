

class OrganizationDto {

  final String ? id;
  final String ? name;
  final String displayName;

  OrganizationDto(this.name, {required this.id, required this.displayName});

  static fromJson(Map<String, dynamic> json) => OrganizationDto(
    json['name'] ?? "",
  displayName:     json['displayName'] ?? "",
  id: json['id'] ?? "",
  );
}