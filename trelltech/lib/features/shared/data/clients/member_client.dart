import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trelltech/config/constant.dart';
import 'package:trelltech/features/organization/data/clients/dtos/organization_dto.dart';
import 'dtos/member_dto.dart';

part 'member_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MemberClient {

  factory MemberClient(Dio dio) = _MemberClient;

  @GET("/tokens/{token}/member")
  Future<MemberDto> getMemberByToken(
    @Path('token') String id
  );

  @GET("/members/{id}/organizations")
  Future<List<OrganizationDto>> getOrganizationByMemberId({
    @Path('id') String ? id,
    @Query('fields') String ? field
  });
}