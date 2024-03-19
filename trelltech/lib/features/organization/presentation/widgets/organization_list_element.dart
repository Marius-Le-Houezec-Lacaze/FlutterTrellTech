import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/organization/domain/arguments/organization_arguments.dart';
import 'package:trelltech/features/organization/domain/services/organization_service.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

class OrganizationListElement extends StatelessWidget {
  void Function() getOrganizations;
  void Function(OrganizationEntity organizationEntity,
      Function(OrganizationEntity) onSubmitAction) showBottomSheet;

  OrganizationEntity organizationEntity;

  OrganizationListElement(
      this.organizationEntity, this.getOrganizations, this.showBottomSheet,
      {super.key});

  final OrganizationService _organizationService = sl<OrganizationService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: Slidable(
          direction: Axis.horizontal,
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              ..._buildActions(),
            ],
          ),
          child: AnimatedContainer(
              height: 60,
              duration: const Duration(seconds: 2),
              child: Material(
                color: Theme.of(context).colorScheme.secondary,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/boards",
                        arguments:
                            OrganizationArguments(organizationEntity.id!));
                  },
                  child: Center(
                      child: Text('Entry ${organizationEntity.displayName}')),
                ),
              )
          )
      ),
    );
  }

  List<SlidableAction> _buildActions() {
    return [
      SlidableAction(
        onPressed: (BuildContext context) async {
          var result = await _organizationService
              .deleteOrganization(organizationEntity.id!);
          if (result.isSuccess()) {
            getOrganizations();
          }
        },
        backgroundColor: const Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),
      SlidableAction(
        onPressed: (BuildContext context) {
          showBottomSheet(organizationEntity, (organizationEntity) async {
            await _organizationService.updateOrganization(organizationEntity);
            getOrganizations();
          });
        },
        backgroundColor: const Color(0xFF21B7CA),
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: 'Edit',
      ),
    ];
  }
}
