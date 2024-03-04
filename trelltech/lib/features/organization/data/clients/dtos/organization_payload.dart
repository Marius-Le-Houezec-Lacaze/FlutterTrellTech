

import 'package:json_annotation/json_annotation.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

@JsonSerializable()
class OrganizationPayload  {

  final String displayName;

  String ? name;

  String ? desc;

  String ? website;


  OrganizationPayload(this.website, this.desc,this.name,{
    required this.displayName,
  });


  factory OrganizationPayload.FromEntity(OrganizationEntity organizationEntity) => OrganizationPayload("", "", organizationEntity.name, displayName: organizationEntity.displayName);

  Map<String, dynamic> toJson() => {
    'displayName': displayName,
    'name': name,
    'desc': desc,
    'website': website,
  };
}