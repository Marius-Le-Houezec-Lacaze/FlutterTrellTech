

import 'package:trelltech/features/boards/data/clients/board_client.dart';
import 'package:trelltech/features/boards/data/clients/dtos/board_creation_payload.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/entities/complete_board.dart';
import 'package:trelltech/features/boards/domain/entities/complete_list.dart';
import 'package:trelltech/features/boards/domain/entities/list_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';
import 'package:trelltech/features/shared/data/clients/card_client.dart';
import 'package:trelltech/features/shared/domain/services/card_service.dart';

class BoardServiceImpl implements BoardService {

  final BoardsClient _boardClient;
  final CardService _cardService;

  BoardServiceImpl(this._boardClient, this._cardService);

  @override
  Future<List<BoardEntity>> getBoardByOrganizationIdAsync(String organizationId) async {
    var response = await _boardClient.getBoardByOrganizationId(organizationId);
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
    var response = await _boardClient.getBoardsTemplate();
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
    var response = await _boardClient.createBoard(BoardCreationPayload.fromEntity(boardEntity));

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
    var response = await _boardClient.getBoardById(boardId);

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
    var response = await _boardClient.getListsByBoardId(boardId);

    var result = response.getOrThrow();

    return result.map<ListEntity>((e) => ListEntity(
      name: e.name,
      id: e.id,
      idBoard: e.idBoard,
    )).toList();
  }

  @override
  Future<CompleteBoardEntity> getCompleteBoardById(String boardId) async {
    var lists = await getListsByBoardId(boardId);
    var board = await getBoardByIdAsync(boardId);
    var cards = await Future.wait (lists.map((list) async => CompleteListEntity(
      idBoard: list.idBoard,
      id: list.id,
      name: list.name,
      cards: await _cardService.getCardByListId(list.id!),
    )).toList());

    return CompleteBoardEntity.fromBoardEntity(board, cards);
  }

}