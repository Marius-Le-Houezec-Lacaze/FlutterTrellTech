

import '../entities/member_entity.dart';

abstract class MemberService {
  Future<MemberEntity> getMemberByToken(String token);
}