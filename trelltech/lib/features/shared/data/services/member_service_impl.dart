

import 'package:trelltech/features/shared/domain/entities/member_entity.dart';
import 'package:trelltech/features/shared/domain/services/member_service.dart';

import '../clients/member_client.dart';

final class MemberServiceImpl implements MemberService {

  final MemberClient _memberClient;

  MemberServiceImpl(this._memberClient);

  @override
  Future<MemberEntity> getMemberByToken(String token) async {
    print("getMemberToken");
    print(token);
    final result = await _memberClient.getMemberByToken(token);
    print(result);
    print("client call");

    return MemberEntity(result.id);
  }

}