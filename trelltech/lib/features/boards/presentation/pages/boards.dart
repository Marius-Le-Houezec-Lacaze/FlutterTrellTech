import 'package:flutter/material.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';
import 'package:trelltech/features/organization/domain/arguments/organization_arguments.dart';

class Boards extends StatelessWidget{
  OrganizationArguments arguments;

  BoardService boardService = sl<BoardService>();

  Boards(this.arguments, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(arguments.organizationId)
      ],
    );
  }
}