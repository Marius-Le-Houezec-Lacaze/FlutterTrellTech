import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:trelltech/config/constant.dart';
import 'package:trelltech/features/boards/data/clients/dtos/board_creation_payload.dart';
import 'package:trelltech/features/boards/data/clients/dtos/board_dto.dart';
import 'package:trelltech/features/boards/data/clients/dtos/board_update_payload.dart';
import 'package:trelltech/features/boards/data/clients/dtos/list_dto.dart';


class BoardsClient {

  final Dio _dio;
  BoardsClient(this._dio);

  final String url = baseUrl;

  Future<Result<List<BoardDto>,DioException>> getBoardByOrganizationId(
      String organizationId
      ) async {
    try{
      final result = await _dio.get<List<dynamic>>("${url}organizations/$organizationId/boards");

      if(result.data == null){
        return Failure(DioException(requestOptions: result.requestOptions));
      }

      final boards = result.data!.map<BoardDto>((json) => BoardDto.fromJson(json)).toList();
      return Success(boards);
    } on DioException catch(e){
      return Failure(e);
    }
  }

  Future<Result<List<BoardDto>,DioException>> getBoardsTemplate() async {
    try{
      final result = await _dio.get<List<dynamic>>("${url}boards/templates/gallery");

      if(result.data == null){
        return Failure(DioException(requestOptions: result.requestOptions));
      }

      final boards = result.data!.map<BoardDto>((json) => BoardDto.fromJson(json)).toList();
      return Success(boards);
    } on DioException catch(e){
      print(e.message);
      return Failure(e);
    }
  }

  Future<Result<BoardDto, DioException>> createBoard(BoardCreationPayload payload) async {
    try {
      final result = await _dio.post("${url}boards", data: payload.toJson());

      return Success(BoardDto.fromJson(result.data));
    } on DioException catch (e){
      return Failure(e);
    }
  }

  Future<Result<BoardDto, DioException>> getBoardById (String boardId) async {
    try {
      final result = await _dio.get('$url/boards/$boardId?lists=all');

      return Success (BoardDto.fromJson(result.data));
    } on DioException catch (e){
      return Failure(e);
    }
  }

  Future<Result<List<ListDto>, DioException>> getListsByBoardId (String boardId) async {
    try {
      final result = await _dio.get<List<dynamic>>('${url}boards/$boardId/lists');

      return Success(result.data!.map<ListDto>((e) => ListDto.fromJson(e)).toList());
    } on DioException catch (e){
      return Failure(e);
    }
  }

  Future<Result<BoardDto, DioException>> deleteBoardById(String boardId) async {
    try {
      final result = await _dio.delete('${url}boards/$boardId');

      return Success(BoardDto.fromJson(result.data));
    } on DioException catch(e){
      return Failure(e);
    }
  }

  Future<Result<BoardDto, DioException>> updateBoard(BoardUpdatePayload boardUpdatePayload) async {
    var id = boardUpdatePayload.id;
    try{
      final result = await _dio.put('${url}boards/$id', data: boardUpdatePayload.toJson());

      return Success(BoardDto.fromJson(result.data));
    } on DioException catch(e){
      return Failure(e);
    }
  }

}

