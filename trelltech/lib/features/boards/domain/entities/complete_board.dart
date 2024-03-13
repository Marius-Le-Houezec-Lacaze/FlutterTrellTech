

import 'package:trelltech/features/boards/domain/entities/list_entity.dart';

class BoardEntity {

  String ? id;

  String ? name;

  String ? description;

  String ? idBoardSource;

  String ? idOrganization;

  List<ListEntity> ? lists;


  BoardEntity({this.name, this.description, this.id, this.idBoardSource, this.idOrganization});
}