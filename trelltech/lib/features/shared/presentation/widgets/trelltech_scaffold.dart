import 'package:flutter/material.dart';
import 'package:trelltech/features/organization/presentation/pages/organization.dart';
import 'package:trelltech/features/shared/presentation/widgets/organization_app_bar.dart';
import 'package:trelltech/features/shared/presentation/widgets/trelltech_drawer.dart';

class TrellTechScaffold extends StatefulWidget{
   TrellTechScaffold({super.key});

  @override
  State<TrellTechScaffold> createState() => _TrellTechScaffoldState();
}

class _TrellTechScaffoldState extends State<TrellTechScaffold> {

  Widget page = const Organization();
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
      key: globalKey,
      appBar: const TrellTechAppBar(),
      endDrawer: TrellTechDrawer(
          onNavigationChange:(widget){
        setState(() {
          page = widget;
        });
      } ),
      body: page,
    ));

  }
}