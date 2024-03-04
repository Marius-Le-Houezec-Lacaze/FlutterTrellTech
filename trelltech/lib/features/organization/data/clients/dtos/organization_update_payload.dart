

import 'package:json_annotation/json_annotation.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

@JsonSerializable()
class OrganizationUpdatePayload  {

  String ? id;

  String ? displayName;

  String ? name;

  String ? desc;

  String ? website;


  OrganizationUpdatePayload(this.website, this.desc,this.name,{
    this.id,
    this.displayName,
  });


  factory OrganizationUpdatePayload.FromEntity(OrganizationEntity organizationEntity) => OrganizationUpdatePayload("", "", organizationEntity.name, id: organizationEntity.id,displayName: organizationEntity.displayName);

  Map<String, dynamic> toJson() => {
    'id': id,
    'displayName': displayName,
    'name': name,
    'desc': desc,
    'website': website,
  };
}