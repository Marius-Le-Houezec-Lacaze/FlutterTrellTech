import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CardDto {

  final String ? id;
  final String ? desc;
  final String ? name;
  final bool ? closed;

  CardDto( {
    this.id,
    this.desc,
    this.name,
    this.closed,
  });

  factory CardDto.fromJson(Map<String, dynamic> json) => CardDto(
    id: json['id'] ?? "",
    desc: json['desc'] ?? "",
    name: json['name'] ?? "",
    closed: json['closed'],
  );
}