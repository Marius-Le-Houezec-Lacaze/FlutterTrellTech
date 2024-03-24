import 'dart:ffi';

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/boards/domain/arguments/board_show_argument.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/entities/complete_board.dart';
import 'package:trelltech/features/boards/domain/entities/list_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';
import 'package:trelltech/features/boards/presentation/pages/boards_index.dart';
import 'package:trelltech/features/boards/presentation/widget/board_card.dart';
import 'package:trelltech/features/boards/presentation/widget/card_form.dart';
import 'package:trelltech/features/shared/domain/entities/card_entity.dart';
import 'package:trelltech/features/shared/domain/services/card_service.dart';

class BoardShow extends StatefulWidget {
  final BoardShowArgument argument;

  const BoardShow(this.argument, {super.key});

  @override
  State<BoardShow> createState() => _BoardShowState();
}

class _BoardShowState extends State<BoardShow> {
  final BoardService boardService = sl<BoardService>();
  final CardService cardService = sl<CardService>();

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

  late CompleteBoardEntity board;
  late AppFlowyBoardScrollController scrollCrontroller;

  late List<ListEntity> lists;

  @override
  void initState() {
    scrollCrontroller = AppFlowyBoardScrollController();
    _getBoard();

    super.initState();
  }

  _getBoard() async {
    var result =
    await boardService.getCompleteBoardById(widget.argument.boardId);
    setState(() {
      board = result;
    });

    for (var element in result.lists!) {
      var cards = element.cards?.map((e) => BoardCard(e.name!)).toList();
      final groupData = AppFlowyGroupData(
          id: element.id!, items: cards!, name: element.name!);
      boardController.addGroup(groupData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = AppFlowyBoardConfig(
      groupBackgroundColor: Colors.black,
      stretchGroupHeight: false,
    );

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white70),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Action pour retourner à la page précédente
            },
          ),
          title: Text(
            board.name!,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.black87,
          centerTitle: true, // Centre le titre de l'AppBar
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      board.backgroundImage!,
                    ))),
            child: AppFlowyBoard(
                headerBuilder: (context, groupData) => Text(
                      groupData.headerData.groupName,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                controller: boardController,
                boardScrollController: scrollCrontroller,
                groupConstraints: const BoxConstraints.tightFor(width: 340),
                footerBuilder: (context, groupData) =>
                    ElevatedButton(onPressed: ()  {
                      _showBottomSheet(CardEntity(id: null, desc: '', name: '', closed: false, idList: groupData.id), (CardEntity cardEntity) async {
                          try {
                            var card = await cardService.createCard(cardEntity);

                          } catch(e){

                          }

                      });
                    },
                        child: const Text('Create new card')),
                config: config,
                cardBuilder: (context, groupData, item) {
                  return AppFlowyGroupCard(
                    decoration: BoxDecoration(color: Colors.transparent),
                    key: ValueKey(item.id),
                    child: RowWidget(
                        item: item as BoardCard, key: ObjectKey(item)),
                  );
                })));
  }

  _showBottomSheet(CardEntity cardEntity, Function(CardEntity cardEntity) onSubmitAction) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context){
          return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: CardForm(card: cardEntity,onSubmitAction: (card)=>{}),
              ));
        });
  }
}
