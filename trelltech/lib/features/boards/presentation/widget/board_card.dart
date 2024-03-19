import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final BoardCard item;

  const RowWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromRGBO(37, 35, 43, 1),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              item.s,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ));
  }
}

class BoardCard extends AppFlowyGroupItem {
  final String s;

  BoardCard(this.s);

  @override
  String get id => s;
}
