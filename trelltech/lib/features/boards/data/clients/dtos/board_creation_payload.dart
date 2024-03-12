import 'package:trelltech/features/boards/domain/entities/board_entity.dart';

class BoardCreationPayload {
  final String name;
  String idBoardSource;
  String idOrganization;

  BoardCreationPayload(this.idBoardSource, this.idOrganization, this.name);

  toJson() => {
    'name': name,
    'idBoardSource': idBoardSource,
    'idOrganization': idOrganization
  };

  factory BoardCreationPayload.fromEntity(BoardEntity boardEntity) => BoardCreationPayload(boardEntity.idBoardSource!, boardEntity.idOrganization!, boardEntity.name!);
}