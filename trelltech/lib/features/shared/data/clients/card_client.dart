import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:trelltech/config/constant.dart';
import 'package:trelltech/features/boards/data/clients/dtos/card_creation_payload.dart';
import 'package:trelltech/features/shared/data/clients/dtos/card_dto.dart';

class CardClient {
  final Dio _dio;

  CardClient(this._dio);

  final String url = baseUrl;

  Future<Result<List<CardDto>, DioException>> getCardByListId(
      String listId) async {
    try {
      final result = await _dio.get("${url}lists/$listId/cards");
      final card =
          result.data!.map<CardDto>((json) => CardDto.fromJson(json)).toList();
      return Success(card);
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<CardDto, DioException>> createCard(CardCreationPayload cardCreationPayload) async {
    try{
      final result = await _dio.post('${url}cards', data: cardCreationPayload.toJson());

      return Success(CardDto.fromJson(result.data));
    } on DioException catch(e){
      return Failure(e);
    }
  }
}
