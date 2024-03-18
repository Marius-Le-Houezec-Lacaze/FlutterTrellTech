import 'package:trelltech/features/shared/domain/entities/card_entity.dart';

class CompleteListEntity {
  String? id;

  String? name;

  String? idBoard;

  List<CardEntity>? cards;

  CompleteListEntity({this.cards, this.name, this.id, this.idBoard});
}
