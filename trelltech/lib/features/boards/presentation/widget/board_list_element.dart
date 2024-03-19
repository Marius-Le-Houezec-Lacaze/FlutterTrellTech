import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/boards/domain/arguments/board_show_argument.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';

class BoardListElement extends StatefulWidget{
  BoardEntity boardEntity;

  Function(BoardEntity boardEntity, Function(BoardEntity p1) onSubmitAction) showBottomSheet;

  BoardListElement(this.boardEntity, this.showBottomSheet, {super.key});

  @override
  State<BoardListElement> createState() => _BoardListElementState();
}

class _BoardListElementState extends State<BoardListElement> {

  final BoardService _boardService = sl<BoardService>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Slidable(
            direction: Axis.horizontal,
            endActionPane: const ActionPane(
              motion: ScrollMotion(),
              children: [
                ..._buildActions(),
              ],
            ),
            child: AnimatedContainer(
                height: 60,
                duration: const Duration(seconds: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/boardshow",
                          arguments: BoardShowArgument(boardEntity.id!));
                    },
                    child: Center(
                        child: Text(
                      'Entry ${boardEntity.name}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ))));
  }

  List<SlidableAction> _buildActions() {
    return [
      SlidableAction(
        onPressed: (BuildContext context) async {
          var result = await _boardService
              .deleteBoardById(widget.boardEntity.id!);
          // if (result.isSuccess()) {
          //   // getOrganizations();
          // }
        },
        backgroundColor: const Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),
      SlidableAction(
        onPressed: (BuildContext context) {
          widget.showBottomSheet(widget.boardEntity, (boardEntity) async {
            await _boardService.updateBoard(boardEntity);
            // getOrganizations();
          });
        },
        backgroundColor: const Color(0xFF21B7CA),
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: 'Edit',
      ),
    ];
  }

}
