import 'package:trelltech/features/shared/domain/entities/card_entity.dart';

abstract class CardService{
  Future<List<CardEntity>> getCardByListId(String listId);
  Future<CardEntity> createCard(CardEntity cardEntity);
}