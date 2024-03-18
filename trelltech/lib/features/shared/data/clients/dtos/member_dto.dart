import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MemberDto {

  final String ? id;

  MemberDto({
    this.id,
  });

  factory MemberDto.fromJson(Map<String, dynamic> json) => MemberDto(
    id: json['id'] ?? "",
  );
}