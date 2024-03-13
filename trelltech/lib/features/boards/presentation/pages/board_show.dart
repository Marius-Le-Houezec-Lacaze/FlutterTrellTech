

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/boards/domain/arguments/board_show_argument.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';

class BoardShow extends StatefulWidget{
  final BoardShowArgument argument;
  const BoardShow(this. argument, {super.key});

  @override
  State<BoardShow> createState() => _BoardShowState();
}

class _BoardShowState extends State<BoardShow> {
  final BoardService boardService = sl<BoardService>();

  final AppFlowyBoardController _appFlowyBoardController = AppFlowyBoardController();

  late Future<BoardEntity> board;

  @override
  void initState() {
    _getBoard();
    // TODO: implement initState
    super.initState();
  }

  _getBoard() {
    setState(() {
      board = boardService.getBoardByIdAsync(widget.argument.boardId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppFlowyBoard(controller: _appFlowyBoardController, cardBuilder: (context, groupData, item) {
      return AppFlowyGroupCard();
    },);
  }
}