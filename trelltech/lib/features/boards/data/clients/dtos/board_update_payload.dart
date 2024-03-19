import 'package:trelltech/features/boards/domain/entities/board_entity.dart';

class BoardUpdatePayload {

  final String id;
  final String name;
  String idOrganization;

  BoardUpdatePayload(this.idOrganization, this.name, this.id);

  toJson() => {
    'name': name,
    'idOrganization': idOrganization
  };

  factory BoardUpdatePayload.fromEntity(BoardEntity boardEntity) => BoardUpdatePayload( boardEntity.idOrganization!, boardEntity.name!,boardEntity.id!);
}