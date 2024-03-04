

import 'package:trelltech/features/shared/domain/entities/member_entity.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';
import 'package:trelltech/features/shared/domain/services/member_service.dart';

import '../clients/member_client.dart';

final class MemberServiceImpl implements MemberService {

  final MemberClient _memberClient;

  MemberServiceImpl(this._memberClient);

  @override
  Future<MemberEntity> getMemberByToken(String token) async {
    final result = await _memberClient.getMemberByToken(token);

    return MemberEntity(result.id);
  }

  @override
  Future<List<OrganizationEntity>> getOrganizationByUserId(String userId) async {
    final results = await _memberClient.getOrganizationByMemberId(id:userId);

    return results.map<OrganizationEntity>( (dto) => OrganizationEntity(
      displayName: dto.displayName,
      id: dto.id,
      name: dto.name,
    )).toList();
  }

}