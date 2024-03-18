import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/entities/complete_list.dart';

class CompleteBoardEntity {
  String? id;

  String? name;

  String? description;

  String? idBoardSource;

  String? idOrganization;

  List<CompleteListEntity>? lists;

  CompleteBoardEntity(
      {this.name,
      this.description,
      this.id,
      this.idBoardSource,
      this.idOrganization,
      this.lists});

  factory CompleteBoardEntity.fromBoardEntity(
          BoardEntity boardEntity, List<CompleteListEntity> lists) =>
      CompleteBoardEntity(
        description: boardEntity.description,
        name: boardEntity.name,
        id: boardEntity.id,
        idBoardSource: boardEntity.idBoardSource,
        idOrganization: boardEntity.idOrganization,
        lists: lists,
      );
}
