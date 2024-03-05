import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrellTechDrawer extends StatelessWidget{
  const TrellTechDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(child: Text("TrellTech")
          )
        ],
      ),
    );
  }

}