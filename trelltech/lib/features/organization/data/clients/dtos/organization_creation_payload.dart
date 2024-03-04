

import 'package:json_annotation/json_annotation.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

@JsonSerializable()
class OrganizationCreationPayload  {

  String ? displayName;

  String ? name;

  String ? desc;

  String ? website;


  OrganizationCreationPayload(this.website, this.desc,this.name,{
     this.displayName,
  });


  factory OrganizationCreationPayload.FromEntity(OrganizationEntity organizationEntity) => OrganizationCreationPayload("", "", organizationEntity.name, displayName: organizationEntity.displayName);

  Map<String, dynamic> toJson() => {
    'displayName': displayName,
    'name': name,
    'desc': desc,
    'website': website,
  };
}