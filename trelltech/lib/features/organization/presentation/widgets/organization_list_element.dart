
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/organization/domain/arguments/organization_arguments.dart';
import 'package:trelltech/features/organization/domain/services/organization_service.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

class OrganizationListElement extends StatelessWidget {

  void Function() getOrganizations;
  void Function(OrganizationEntity organizationEntity,Function(OrganizationEntity) onSubmitAction) showBottomSheet;

  OrganizationEntity organizationEntity;


  OrganizationListElement(this.organizationEntity, this.getOrganizations,this.showBottomSheet, {super.key});


  final OrganizationService _organizationService = sl<OrganizationService>();

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Slidable(
        direction: Axis.horizontal,
        endActionPane:  ActionPane(

          motion: const ScrollMotion(),
          children: [
              ..._buildActions(),
          ],
        ),
        child: AnimatedContainer(
            height: 60,
            duration: const Duration(seconds:2),
            child: Material(
              borderRadius: BorderRadius.circular(10),
                      color:Theme.of(context).colorScheme.primary,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, "/boards", arguments: OrganizationArguments(organizationEntity.id!));
                        },
                        child: Center(
                            child: Text('Entry ${organizationEntity.displayName}', style: TextStyle(color: Colors.white),)),
                      ),
                    )
    )));
  }

  List<SlidableAction> _buildActions() {
    return [
      SlidableAction(
        onPressed: (BuildContext context) async {
          var result = await _organizationService.deleteOrganization(organizationEntity.id!);
          if(result.isSuccess()){
            getOrganizations();
          }
        },
        backgroundColor: const Color(0xFFFE4A49),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),
      SlidableAction(
        onPressed: (BuildContext context){
          showBottomSheet(organizationEntity, (organizationEntity) async {
            await _organizationService.updateOrganization(organizationEntity);
            getOrganizations();
          });
        },
        backgroundColor: const Color(0xFF21B7CA),
        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
        foregroundColor: Colors.white,
        icon: Icons.edit,

        label: 'Edit',
      ),
    ];
  }
}