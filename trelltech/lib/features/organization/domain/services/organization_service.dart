

import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

abstract class OrganizationService {


  Future<OrganizationEntity> createOrganization(OrganizationEntity organizationEntity);
}