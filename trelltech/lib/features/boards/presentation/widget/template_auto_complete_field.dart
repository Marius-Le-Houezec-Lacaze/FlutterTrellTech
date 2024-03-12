
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';

class TemplateAutoCompleteField extends StatefulWidget {
  final Function(BoardEntity) onSelected;

  const TemplateAutoCompleteField({super.key, required this.onSelected});

  @override
  State<TemplateAutoCompleteField> createState() => _TemplateAutoCompleteFieldState();
}

class _TemplateAutoCompleteFieldState extends State<TemplateAutoCompleteField> {

  final BoardService _boardService = sl<BoardService>();

  List<BoardEntity> _template = [];


  @override
  void initState() {
    super.initState();
    _fetchTemplateAsync();
  }

  _fetchTemplateAsync() async {
    var result = await _boardService.getBoardTemplateAsync();

    setState(() {
      _template = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<BoardEntity>(
      fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextFormField(
          decoration: const InputDecoration(
              hintText: 'Template',
          ),
          controller: textEditingController,
          focusNode: focusNode,
        );
      },
      displayStringForOption: (option) {
        return option.name!;
      },
      optionsBuilder: (TextEditingValue templateEditingValue) {

        if (templateEditingValue.text == '') {
          return const Iterable<BoardEntity>.empty();
        }

        return _template.where((BoardEntity boardEntity) {
          return boardEntity
              .name
              !.contains(templateEditingValue.text.toLowerCase());
        });
      },
      onSelected: widget.onSelected,
    );
  }
}