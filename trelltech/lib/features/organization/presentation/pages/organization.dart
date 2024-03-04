import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trelltech/features/organization/domain/services/organization_service.dart';
import 'package:trelltech/features/organization/presentation/widgets/organization_form.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

import '../../../../container.dart';
import '../../../shared/domain/services/member_service.dart';

class Organization extends StatefulWidget {
  const Organization({super.key});



  @override
  void initState() {

  }

  @override
  State<Organization> createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {

  final MemberService _memberService = sl<MemberService>();
  final OrganizationService _organizationService = sl<OrganizationService>();
  final globalKey = GlobalKey<ScaffoldState>();

   late Future<List<OrganizationEntity>> _organizations ;

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

    // return _memberService.getOrganizationByUserId(prefs.getString("userId")!);
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
    return  Scaffold(
        key: globalKey,
        floatingActionButton: _buildFloatingButton(context),
        body: Center(
          child: _buildList(),
        )
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
                  return  _buildListElement(listOrg, index);
                }
            );
          // }
        });
  }

  Slidable _buildListElement(AsyncSnapshot<List<OrganizationEntity>> listOrg, int index) {
    return Slidable(
                      direction: Axis.horizontal,
                      endActionPane:  ActionPane(

                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (BuildContext context) async {
                              var result = await _organizationService.deleteOrganization(listOrg.data![index].id!);
                              print(result);
                                if(result.isSuccess()){
                                  _getOrganizations();
                                }
                              },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: (BuildContext context){
                              _showBottomSheet(listOrg.data![index], (organizationEntity) async {
                                await _organizationService.updateOrganization(organizationEntity);
                                _getOrganizations();
                              });
                            },
                            backgroundColor: const Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,

                            label: 'Edit',
                          ),
                        ],
                      ),
                      child: AnimatedContainer(
                        height: 60,
                        duration: const Duration(seconds:2),
                        child: Material(
                          color:Colors.amber,
                          child: InkWell(
                              child: Center(child: Text('Entry ${listOrg.data![index].displayName}')),
                          ),
                        )
                      )
                  );
  }
}