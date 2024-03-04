import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:trelltech/config/constant.dart';
import 'package:trelltech/features/organization/data/clients/dtos/organization_dto.dart';
import 'package:trelltech/features/organization/data/clients/dtos/organization_creation_payload.dart';
import 'package:trelltech/features/organization/data/clients/dtos/organization_update_payload.dart';

class OrganizationClient {
  OrganizationClient(this._dio);

  final Dio _dio;
  final String url = '${baseUrl}organization';

  Future<OrganizationDto> createOrganization(OrganizationCreationPayload payload) async {
    final result = await _dio.post(url, data: payload.toJson());

    return OrganizationDto.fromJson(result.data);
  }

  Future<OrganizationDto> getOrganization(String organizationId) async {
    final result = await  _dio.post('$url/$organizationId');

    return OrganizationDto.fromJson(result.data);
  }

  Future<Result<OrganizationDto, DioException>> deleteOrganization(String organizationId) async {
    try {
      final result = await _dio.delete('$url/$organizationId');

      return Success(OrganizationDto.fromJson(result.data));
    } on DioException catch(e){
      return Failure(e);
    }
  }

  Future<Result<OrganizationDto, DioException>> updateOrganization(OrganizationUpdatePayload organizationUpdatePayload) async {
    var id = organizationUpdatePayload.id;
    try{
      final result = await _dio.put('$url/$id', data: organizationUpdatePayload.toJson());

      return Success(OrganizationDto.fromJson(result.data));
    } on DioException catch(e){
      return Failure(e);
    }

  }
}