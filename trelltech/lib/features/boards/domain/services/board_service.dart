
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';

abstract class BoardService {
  Future<List<BoardEntity>> getBoardByOrganizationIdAsync(String organizationId);
  Future<List<BoardEntity>> getBoardTemplateAsync();
  Future<BoardEntity> createBoardAsync(BoardEntity boardEntity);
}