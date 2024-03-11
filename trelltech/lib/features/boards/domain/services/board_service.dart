
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';

abstract class BoardService {
  Future<List<BoardEntity>> getBoardByOrganizationId(String organizationId);
}