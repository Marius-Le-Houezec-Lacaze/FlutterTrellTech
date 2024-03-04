
import 'package:trelltech/features/organization/data/clients/dtos/organization_payload.dart';
import 'package:trelltech/features/organization/data/clients/organization_client.dart';
import 'package:trelltech/features/organization/domain/services/organization_service.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

class OrganizationServiceImpl implements OrganizationService {
  OrganizationClient organizationClient;

  OrganizationServiceImpl(this.organizationClient);
  @override
  Future<OrganizationEntity> createOrganization(OrganizationEntity organizationEntity) async {
    var payload = OrganizationPayload.FromEntity(organizationEntity);

    await organizationClient.createOrganization(payload);

    return OrganizationEntity(displayName: "test");
  }

}