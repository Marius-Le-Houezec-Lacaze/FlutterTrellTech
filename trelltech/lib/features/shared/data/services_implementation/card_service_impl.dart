import 'package:trelltech/features/shared/data/clients/card_client.dart';
import 'package:trelltech/features/shared/domain/entities/card_entity.dart';
import 'package:trelltech/features/shared/domain/services/card_service.dart';

final class CardServiceImpl implements CardService {
  final CardClient _cardClient;

  CardServiceImpl(this._cardClient);

  @override
  Future<List<CardEntity>> getCardByListId(String listId) async {
    var result = await _cardClient.getCardByListId(listId);
    var cards = result.getOrThrow();
    return cards
        .map((cardDto) => CardEntity(
            id: cardDto.id,
            desc: cardDto.desc,
            name: cardDto.name,
            closed: cardDto.closed))
        .toList();
  }
}
