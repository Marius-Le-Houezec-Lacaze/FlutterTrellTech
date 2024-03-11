import 'package:flutter/material.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';
import 'package:trelltech/features/boards/presentation/widget/board_list_element.dart';
import 'package:trelltech/features/organization/domain/arguments/organization_arguments.dart';

class Boards extends StatefulWidget{
  OrganizationArguments arguments;


  Boards(this.arguments, {super.key});

  @override
  State<Boards> createState() => _BoardsState();
}

class _BoardsState extends State<Boards> {
  final BoardService _boardService = sl<BoardService>();


  Future<List<BoardEntity>> ? _boards;

  @override
  void initState() {
    _getBoards();
    super.initState();
  }

  void _getBoards() async {
    setState(() {
      _boards = _boardService.getBoardByOrganizationId(widget.arguments.organizationId);;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: _boards, builder: (BuildContext context, AsyncSnapshot<List<BoardEntity>> listBoard) {
        if (!listBoard.hasData) {
          return const Text('Loading...');
        }
        return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: listBoard.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return BoardListElement(listBoard.data![index]);
            }
        );
      }
    ),
    );
  }
}