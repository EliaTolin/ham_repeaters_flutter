import 'package:flutter/material.dart';
import 'package:ham_repeaters/common/extension/hard_coded_string.dart';
import 'package:ham_repeaters/common/widgets/form/base_field.dart';

class AddressField extends StatelessWidget {
  const AddressField(
      {required this.controller, this.isRequired = false, super.key,});

  final TextEditingController controller;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return BaseField(
      isRequired: isRequired,
      validator: (value) {
        if (isRequired && (value == null || value == '')) {
          return 'Campo obbligatorio'.hardcoded;
        }
        return null;
      },
      controller: controller,
      icon: Icons.location_on,
      label: 'Indirizzo'.hardcoded,
    );
  }
}
