

import 'package:flutter/material.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/presentation/widget/template_auto_complete_field.dart';
import '../../../shared/domain/entities/organization_entity.dart';

class BoardForm extends StatefulWidget{

  final BoardEntity board;

  final Function(BoardEntity) onSubmitAction;

  const BoardForm({super.key, required this.board, required this.onSubmitAction});

  @override
  State<BoardForm> createState() => _BoardFormState();
}

class _BoardFormState extends State<BoardForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(20),
        child :Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Name'
            ),
            initialValue: widget.board.name,
            onChanged: (String name) => {
              widget.board.name = name
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Description'
            ),
            initialValue: widget.board.description,
            onChanged: (String description) => {
              widget.board.description = description
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TemplateAutoCompleteField(onSelected: (BoardEntity selectedBoard){
            widget.board.idBoardSource = selectedBoard.id;
          }),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  widget.onSubmitAction(widget.board);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    ));
  }
}