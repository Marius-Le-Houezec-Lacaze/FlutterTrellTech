import 'package:flutter/material.dart';
import 'package:trelltech/features/organization/presentation/pages/organization.dart';
import 'package:trelltech/features/shared/presentation/widgets/organization_app_bar.dart';
import 'package:trelltech/features/shared/presentation/widgets/trelltech_drawer.dart';

class TrelltechScaffold extends StatefulWidget{
  const TrelltechScaffold({super.key});

  @override
  State<TrelltechScaffold> createState() => _TrelltechScaffoldState();
}

class _TrelltechScaffoldState extends State<TrelltechScaffold> {
  final globalKey = GlobalKey<ScaffoldState>();
  final List<Widget> pages = [
    const Organization()
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
      key: globalKey,
      appBar: const TrellTechAppBar(),
      endDrawer: TrellTechDrawer(),
      body: pages[0],
    ));

  }
}