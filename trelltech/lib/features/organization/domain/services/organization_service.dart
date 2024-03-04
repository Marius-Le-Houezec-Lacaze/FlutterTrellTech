

import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

import '../../data/clients/dtos/organization_dto.dart';

abstract class OrganizationService {

  Future<OrganizationEntity> createOrganization(OrganizationEntity organizationEntity);

  Future<Result<OrganizationEntity, String>> deleteOrganization(String organizationId);

  Future<Result<OrganizationEntity, String>> updateOrganization(OrganizationEntity organizationEntity);
}