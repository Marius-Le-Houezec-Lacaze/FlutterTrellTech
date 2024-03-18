import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trelltech/features/boards/domain/arguments/board_show_argument.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';

class BoardListElement extends StatelessWidget{
  BoardEntity boardEntity;

  BoardListElement(this.boardEntity, {super.key});


  @override
  Widget build(BuildContext context) {
    return Slidable(
        direction: Axis.horizontal,
        endActionPane:  const ActionPane(

          motion: ScrollMotion(),
          children: [
            // ..._buildActions(),
          ],
        ),
        child: AnimatedContainer(
            height: 60,
            duration: const Duration(seconds:2),
            child: Material(
              color:Theme.of(context).colorScheme.primary,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/boardshow", arguments: BoardShowArgument(boardEntity.id!));
                },
                child: Center(child: Text('Entry ${boardEntity.name}')),
              ),
            )
        )
    );
  }

}