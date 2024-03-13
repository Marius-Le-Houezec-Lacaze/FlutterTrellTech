

import 'package:trelltech/features/boards/data/clients/board_client.dart';
import 'package:trelltech/features/boards/data/clients/dtos/board_creation_payload.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/entities/list_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';

class BoardServiceImpl implements BoardService {

  final BoardsClient client;

  BoardServiceImpl(this.client);

  @override
  Future<List<BoardEntity>> getBoardByOrganizationIdAsync(String organizationId) async {
    var response = await client.getBoardByOrganizationId(organizationId);
    if(response.isError()){
      throw Error();
    }

    print(response.toString());
    var result = response.getOrThrow();

    return result.map((e) => BoardEntity(
        name: e.name,
        description: e.description,
        id: e.id)
    ).toList();
  }

  @override
  Future<List<BoardEntity>> getBoardTemplateAsync() async {
    var response = await client.getBoardsTemplate();
    if(response.isError()){
      throw Error();
    }

    var result = response.getOrThrow();

    return result.map((e) => BoardEntity(
        name:e.name,
        description:e.description,
        id:e.id)
    ).toList();
  }

  @override
  Future<BoardEntity> createBoardAsync(BoardEntity boardEntity) async {
    var response = await client.createBoard(BoardCreationPayload.fromEntity(boardEntity));

    if(response.isError()){
      throw Error();
    }
    var result = response.getOrThrow();

    return BoardEntity(
      name: result.name,
      id: result.id,
      description: result.description,
      idBoardSource: result.idBoardSource,
      idOrganization: result.idOrganization,
    );
  }

  @override
  Future<BoardEntity> getBoardByIdAsync(String boardId) async {
    var response = await client.getBoardById(boardId);

    if(response.isError()){
      throw Error();
    }
    var result = response.getOrThrow();

    return BoardEntity(
      name: result.name,
      id: result.id,
      description: result.description,
      idBoardSource: result.idBoardSource,
      idOrganization: result.idOrganization,
    );
  }

  @override
  Future<List<ListEntity>> getListsByBoardId(String boardId) async {
    var response = await client.getListsByBoardId(boardId);

    var result = response.getOrThrow();

    return result.map<ListEntity>((e) => ListEntity(
      name: e.name,
      id: e.id,
      idBoard: e.idBoard,
    )).toList();
  }

}