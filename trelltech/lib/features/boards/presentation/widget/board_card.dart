import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';

class _RowWidget extends StatelessWidget {
  final BoardCard item;
  const _RowWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ObjectKey(item),
      height: 60,
      color: Colors.green,
      child: Center(child: Text(item.s)),
    );
  }
}

class BoardCard extends AppFlowyGroupItem {
  final String s;

  BoardCard(this.s);

  @override
  String get id => s;
}