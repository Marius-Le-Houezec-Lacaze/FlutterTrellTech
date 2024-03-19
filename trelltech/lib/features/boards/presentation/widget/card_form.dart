

import 'package:flutter/material.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/presentation/widget/template_auto_complete_field.dart';
import 'package:trelltech/features/shared/domain/entities/card_entity.dart';
import 'package:trelltech/features/shared/domain/entities/card_entity.dart';
import 'package:trelltech/features/shared/domain/entities/card_entity.dart';
import '../../../shared/domain/entities/organization_entity.dart';

class CardForm extends StatefulWidget{

  final CardEntity card;

  final Function(CardEntity) onSubmitAction;

  const CardForm({super.key, required this.card, required this.onSubmitAction});

  @override
  State<CardForm> createState() => _BoardFormState();
}

class _BoardFormState extends State<CardForm> {
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
            initialValue: widget.card.name,
            onChanged: (String name) => {
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
            onChanged: (String description) => {
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  widget.onSubmitAction(widget.card);
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