import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trelltech/features/boards/presentation/pages/boards_index.dart';
import 'package:trelltech/features/organization/presentation/pages/organization.dart';
import 'package:trelltech/features/shared/domain/entities/list_burger_menu.dart';

class TrellTechDrawer extends StatefulWidget{

  final Function(Widget) onNavigationChange;

  TrellTechDrawer({required this.onNavigationChange,super.key});

  @override
  State<TrellTechDrawer> createState() => _TrellTechDrawerState();
}

class _TrellTechDrawerState extends State<TrellTechDrawer> {

  var selectedIndex = 0;
  final pages = [
    ListBurgerMenu("Workspaces", const Organization(), true),
  ];

  List<Widget> _buildListTile(){
    return pages.map((e) {
      var id = pages.indexOf(e);
      return ListTile(
        title: Text(e.title),
        onTap: ()  {
          widget.onNavigationChange(e.pages);
          setState(() {
            selectedIndex = id;
          });
        },
        selected: (selectedIndex == id),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:  [
          const DrawerHeader(child: Text("TrellTech"),
          ),
          ..._buildListTile()
        ],
      ),
    );
  }
}