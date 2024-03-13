
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/entities/list_entity.dart';

abstract class BoardService {
  Future<List<BoardEntity>> getBoardByOrganizationIdAsync(String organizationId);
  Future<List<BoardEntity>> getBoardTemplateAsync();
  Future<BoardEntity> createBoardAsync(BoardEntity boardEntity);
  Future<BoardEntity> getBoardByIdAsync(String boardId);
  Future<List<ListEntity>> getListsByBoardId(String boardId);
}