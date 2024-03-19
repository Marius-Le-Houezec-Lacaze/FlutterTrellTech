import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/entities/complete_list.dart';

class CompleteBoardEntity extends BoardEntity {
  List<CompleteListEntity>? lists;

  CompleteBoardEntity(
      {backgroundImage,
      name,
      description,
      id,
      idBoardSource,
      idOrganization,
      this.lists})
      : super(
            id: id,
            name: name,
            description: description,
            backgroundImage: backgroundImage,
            idBoardSource: idBoardSource,
            idOrganization: idOrganization);

  factory CompleteBoardEntity.fromBoardEntity(
          BoardEntity boardEntity, List<CompleteListEntity> lists) =>
      CompleteBoardEntity(
        id: boardEntity.id,
        name: boardEntity.name,
        description: boardEntity.description,
        backgroundImage: boardEntity.backgroundImage,
        idBoardSource: boardEntity.idBoardSource,
        idOrganization: boardEntity.idOrganization,
        lists: lists,
      );
}
