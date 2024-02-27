import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';
import 'package:trelltech/config/constant.dart';
import 'dtos/MemberDto.dart';

part 'member_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MemberClient {

  factory MemberClient(Dio dio) = _MemberClient;

  @GET("/tokens/{token}/member")
  Future<MemberDto> getMemberByToken(
        @Path('token') String id
      );
}