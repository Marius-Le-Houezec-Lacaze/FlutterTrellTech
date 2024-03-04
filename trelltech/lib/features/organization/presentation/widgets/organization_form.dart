import 'package:flutter/material.dart';
import '../../../shared/domain/entities/organization_entity.dart';

class OrganizationForm extends StatefulWidget{

  final OrganizationEntity organization;

  final Function(OrganizationEntity) onSubmitAction;

  const OrganizationForm({super.key, required this.organization, required this.onSubmitAction});

  @override
  State<OrganizationForm> createState() => _OrganizationFormState();
}

class _OrganizationFormState extends State<OrganizationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            initialValue: widget.organization.displayName,
            onChanged: (String displayName) => {
              widget.organization.displayName = displayName
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              widget.onSubmitAction(widget.organization);
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
    );
  }
}