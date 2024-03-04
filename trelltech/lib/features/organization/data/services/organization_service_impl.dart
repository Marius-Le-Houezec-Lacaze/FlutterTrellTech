
import 'package:dio/src/dio_exception.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/result.dart';
import 'package:trelltech/features/organization/data/clients/dtos/organization_dto.dart';
import 'package:trelltech/features/organization/data/clients/dtos/organization_creation_payload.dart';
import 'package:trelltech/features/organization/data/clients/dtos/organization_update_payload.dart';
import 'package:trelltech/features/organization/data/clients/organization_client.dart';
import 'package:trelltech/features/organization/domain/services/organization_service.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

class OrganizationServiceImpl implements OrganizationService {
  OrganizationClient organizationClient;

  OrganizationServiceImpl(this.organizationClient);
  @override
  Future<OrganizationEntity> createOrganization(OrganizationEntity organizationEntity) async {
    var payload = OrganizationCreationPayload.FromEntity(organizationEntity);

    await organizationClient.createOrganization(payload);

    return OrganizationEntity(displayName: "test");
  }

  @override
  Future<Result<OrganizationEntity, String>> deleteOrganization(String organizationId) async {
    var dto = await organizationClient.deleteOrganization(organizationId);
    var organizationEntity =dto.getOrNull();
    if( organizationEntity == null){
      return Failure("Error organizationEntityIsNull");
    }

    return Success(OrganizationEntity(
      displayName: organizationEntity.displayName,
      name: organizationEntity.name,
      id: organizationEntity.id,
        ));
  }

  @override
  Future<Result<OrganizationEntity, String>> updateOrganization(OrganizationEntity organizationEntity) async {
  var dto = await organizationClient.updateOrganization(OrganizationUpdatePayload.FromEntity(organizationEntity));
  var result = dto.getOrNull();

  if(dto.isError()&& ( result== null)){
    return const Failure("Error while updating entity");
  }

  var entity = OrganizationEntity(
      id: result?.id,
      name: result?.name,
      displayName: result?.displayName
  );
  return Success(entity);
  }

}