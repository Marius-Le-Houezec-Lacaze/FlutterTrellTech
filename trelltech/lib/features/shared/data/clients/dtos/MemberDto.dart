

class MemberDto {

  final String ? id;

  MemberDto({
    this.id,
  });

  static fromJson(Map<String, dynamic> json) => MemberDto(
    id: json['id'] ?? "",
  );
}