import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:trelltech/config/constant.dart';
import 'package:trelltech/features/boards/data/clients/dtos/board_dto.dart';

class BoardsClient {

  final Dio _dio;
  BoardsClient(this._dio);

  final String url = baseUrl;

  Future<Result<List<BoardDto>,DioException>> getBoardByOrganizationId(
      String organizationId
      ) async {
    try{
      final result = await _dio.get<List<Map<String, dynamic>>>("${url}organization/$organizationId/boards");

      if(result.data == null){
        return Failure(DioException(requestOptions: result.requestOptions));
      }

      final boards = result.data!.map<BoardDto>((json) => BoardDto.fromJson(json)).toList();
      return Success(boards);
    } on DioException catch(e){
      return Failure(e);
    }
  }
}