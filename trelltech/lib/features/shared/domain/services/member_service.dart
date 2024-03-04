

import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

import '../entities/member_entity.dart';

abstract class MemberService {
  Future<MemberEntity> getMemberByToken(String token);

  Future<List<OrganizationEntity>> getOrganizationByUserId(String userId);
}