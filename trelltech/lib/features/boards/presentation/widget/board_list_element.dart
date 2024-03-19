import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trelltech/features/boards/domain/arguments/board_show_argument.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';

class BoardListElement extends StatelessWidget {
  BoardEntity boardEntity;

  BoardListElement(this.boardEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Slidable(
            direction: Axis.horizontal,
            endActionPane: const ActionPane(
              motion: ScrollMotion(),
              children: [
                // ..._buildActions(),
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
}
