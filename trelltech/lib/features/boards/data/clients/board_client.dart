import 'package:dio/dio.dart';
import 'package:trelltech/config/constant.dart';

class BoardsClient {

  final Dio _dio;
  BoardsClient(this._dio);

  final String url = '${baseUrl}';

  getBoardByOrganizationId(
      String organizationId
      ) async {
    final result = await _dio.get("organization/$url/$organizationId/boards");
  }


}