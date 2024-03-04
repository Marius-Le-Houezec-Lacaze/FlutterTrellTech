import 'package:dio/dio.dart';
import 'package:trelltech/config/constant.dart';
import 'package:trelltech/features/organization/data/clients/dtos/organization_dto.dart';
import 'package:trelltech/features/organization/data/clients/dtos/organization_payload.dart';

class OrganizationClient {
  OrganizationClient(this._dio);

  final Dio _dio;
  final String url = '${baseUrl}organization';

  Future<OrganizationDto> createOrganization(OrganizationPayload payload) async {
    final result = await _dio.post(url, data: payload.toJson());

    return OrganizationDto.fromJson(result.data);
  }

  Future<OrganizationDto> getOrganization(String organizationId) async {
    final result = await  _dio.post('$url/$organizationId');

    return OrganizationDto.fromJson(result.data);
  }

  Future<OrganizationDto> deleteOrganization(String organizationId) async {
    final result = await  _dio.delete('$url/$organizationId');

    return OrganizationDto.fromJson(result.data);
  }
}