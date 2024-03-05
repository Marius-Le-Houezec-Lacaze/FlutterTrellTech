import 'package:flutter/material.dart';
import 'package:trelltech/features/organization/presentation/pages/organization.dart';
import 'package:trelltech/features/shared/presentation/widgets/organization_app_bar.dart';
import 'package:trelltech/features/shared/presentation/widgets/trelltech_drawer.dart';

class TrelltechScaffold extends StatefulWidget{
   TrelltechScaffold({super.key});

  @override
  State<TrelltechScaffold> createState() => _TrelltechScaffoldState();
}

class _TrelltechScaffoldState extends State<TrelltechScaffold> {

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