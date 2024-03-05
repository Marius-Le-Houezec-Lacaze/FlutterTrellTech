import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trelltech/features/organization/presentation/pages/organization.dart';
import 'package:trelltech/features/shared/domain/entities/list_burger_menu.dart';

class TrellTechDrawer extends StatelessWidget{
  TrellTechDrawer({super.key});

  final pages = [
    ListBurgerMenu("Workspaces", const Organization())
  ];

  List<Widget> _buildListTile(){
    return pages.map((e) => ListTile(
      title: Text(e.title),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:  [
          DrawerHeader(child: Text("TrellTech"),
          ),
          ..._buildListTile()
        ],
      ),
    );
  }

}