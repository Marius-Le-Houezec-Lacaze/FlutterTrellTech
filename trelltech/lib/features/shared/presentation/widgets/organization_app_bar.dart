import 'package:flutter/material.dart';

class TrellTechAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TrellTechAppBar({super.key});

  @override
  State<TrellTechAppBar> createState() => _TrellTechAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TrellTechAppBarState extends State<TrellTechAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Workspaces"),
      automaticallyImplyLeading: false,
    );

  }
}