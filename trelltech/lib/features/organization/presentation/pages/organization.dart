import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trelltech/features/organization/domain/services/organization_service.dart';
import 'package:trelltech/features/organization/presentation/widgets/organization_form.dart';
import 'package:trelltech/features/shared/domain/entities/member_entity.dart';
import 'package:trelltech/features/shared/domain/entities/organization_entity.dart';

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

  Future<List<OrganizationEntity>> _getOrganizations() async {
    final prefs = await SharedPreferences.getInstance();
    return _memberService.getOrganizationByUserId(prefs.getString("userId")!);
  }

  
  Widget _buildFloatingButton(BuildContext context){
    return FloatingActionButton(onPressed: ()=> _showBottomSheet());
  }

  _showBottomSheet() {
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return  SizedBox(
        height: 400,
        child: Center(
          child:  OrganizationForm(
              organization: OrganizationEntity(
            displayName: "HelloWorld"
          ),
          onSubmitAction: (organizationEntity) async {
                await _organizationService.createOrganization(organizationEntity);
          },)
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
          (future:_getOrganizations(), builder: (BuildContext context, AsyncSnapshot<List<OrganizationEntity>> listOrg) {
          if(!listOrg.hasData){
            return const Text('Loading...');
          }
            return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: listOrg.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onLongPress: () => print('test'),
                      child: AnimatedContainer(
                        height: 50,
                        color: Colors.amber.shade500,
                        duration: const Duration(seconds: 2),
                        child: Center(child: Text('Entry ${listOrg.data![index].displayName}')),
                    )
                  );
                }
            );
          // }
        });
  }
}