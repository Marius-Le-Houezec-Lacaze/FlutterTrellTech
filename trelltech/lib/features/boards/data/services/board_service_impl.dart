

import 'package:trelltech/features/boards/data/clients/board_client.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';

class BoardServiceImpl implements BoardService {

  final BoardsClient client;

  BoardServiceImpl(this.client);

  @override
  Future<List<BoardEntity>> getBoardByOrganizationId(String organizationId) async {
    var response = await client.getBoardByOrganizationId(organizationId);

    if(response.isError()){
      throw Error();
    }

    var result = response.getOrThrow();

    return result.map((e) => BoardEntity(
        e.name,
        e.description,
        id: e.id)
    ).toList();
  }
}