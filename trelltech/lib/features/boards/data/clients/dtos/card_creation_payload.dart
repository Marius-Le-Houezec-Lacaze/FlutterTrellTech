import 'package:trelltech/features/boards/domain/entities/board_entity.dart';

class CardCreationPayload {

  final String name;
  final String desc;
  final String idList;

  CardCreationPayload(this.idList, this.desc, this.name);

  toJson() => {
    'name': name,
    'idList': idList,
    'desc': desc
  };

  // factory CardCreationPayload.fromEntity(BoardEntity boardEntity) => CardCreationPayload(boardEntity.idList!, boardEntity.idOrganization!, boardEntity.name!);
}