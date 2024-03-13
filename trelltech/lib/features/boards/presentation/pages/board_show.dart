

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/boards/domain/arguments/board_show_argument.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/entities/list_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';
import 'package:trelltech/features/boards/presentation/widget/board_card.dart';

class BoardShow extends StatefulWidget{
  final BoardShowArgument argument;
  const BoardShow(this. argument, {super.key});

  @override
  State<BoardShow> createState() => _BoardShowState();
}

class _BoardShowState extends State<BoardShow> {
  final BoardService boardService = sl<BoardService>();

  final AppFlowyBoardController boardController = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );

  late Future<BoardEntity> board;
  late AppFlowyBoardScrollController scrollCrontroller;

  late List<ListEntity> lists;

  @override
  void initState() {
    scrollCrontroller = AppFlowyBoardScrollController();
    _getBoard();



    super.initState();
  }

  _getBoard()async {
    var result = await boardService.
    getListsByBoardId(widget.argument.boardId);
    setState(()  {
      board = boardService.getBoardByIdAsync(widget.argument.boardId);
      lists = result;
    });

    for (var element in result) {
      final groupData = AppFlowyGroupData(id: element.name!, items: [
        BoardCard("Card 3"),
        BoardCard("Card 4"),
      ], name: element.name!);
      boardController.addGroup(groupData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = AppFlowyBoardConfig(
      groupBackgroundColor: Colors.deepOrangeAccent,
      stretchGroupHeight: false,
    );

    return AppFlowyBoard(controller: boardController,
        boardScrollController: scrollCrontroller,
        groupConstraints: const BoxConstraints.tightFor(width: 240),
        config: config,
        cardBuilder: (context, groupData, item) {
      return AppFlowyGroupCard(
        key: ValueKey(item.id),
        child:    RowWidget(
      item: item as BoardCard, key: ObjectKey(item)),
    );
  });
  }
}