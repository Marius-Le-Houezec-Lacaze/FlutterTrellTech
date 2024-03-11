import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trelltech/features/organization/domain/arguments/organization_arguments.dart';
import 'package:trelltech/features/organization/domain/services/organization_service.dart';
import 'package:trelltech/features/organization/presentation/widgets/organization_list_element.dart';
import 'package:trelltech/features/shared/presentation/widgets/organization_app_bar.dart';
import 'package:trelltech/features/organization/presentation/widgets/organization_form.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';
import 'package:trelltech/features/shared/presentation/widgets/trelltech_drawer.dart';
import 'package:trelltech/constants/TrellTechTheme.dart';


import '../../../../container.dart';
import '../../../shared/domain/services/member_service.dart';

class Organization extends StatefulWidget {
  const Organization({super.key});

  @override
  State<Organization> createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {

  final MemberService _memberService = sl<MemberService>();
  final OrganizationService _organizationService = sl<OrganizationService>();
  final globalKey = GlobalKey<ScaffoldState>();

  Future<List<OrganizationEntity>> ? _organizations;

  @override
  void initState() {
    _getOrganizations();
    super.initState();
  }

  void _getOrganizations() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _organizations = _memberService.getOrganizationByUserId(prefs.getString("userId")!);
    });
  }

  
  Widget _buildFloatingButton(BuildContext context){
    return FloatingActionButton(onPressed: ()=> _showBottomSheet(OrganizationEntity(), (organizationEntity) async {
      await _organizationService.createOrganization(organizationEntity);
      _getOrganizations();
    }));
  }

  _showBottomSheet(OrganizationEntity organizationEntity, Function(OrganizationEntity) onSubmitAction) {
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return  SizedBox(
        height: 400,
        child: Center(
          child:  OrganizationForm(
              organization: organizationEntity,
            onSubmitAction: onSubmitAction,
         )
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildList(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(padding: const EdgeInsets.all(16),
            child: _buildFloatingButton(context)
          ),
        )
      ],
    );
  }

  FutureBuilder<List<OrganizationEntity>> _buildList() {
    return FutureBuilder
          (future:_organizations, builder: (BuildContext context, AsyncSnapshot<List<OrganizationEntity>> listOrg) {
          if(!listOrg.hasData){
            return const Text('Loading...');
          }
            return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: listOrg.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return  OrganizationListElement(listOrg.data![index],_getOrganizations,_showBottomSheet);
                }
            );
          // }
        });
  }


}