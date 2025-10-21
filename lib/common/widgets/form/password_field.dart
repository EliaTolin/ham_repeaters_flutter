import 'package:app_template/common/extension/hard_coded_string.dart';
import 'package:app_template/common/widgets/form/base_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    required this.controller,
    required this.label,
    super.key,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return BaseField(
      controller: controller,
      isRequired: true,
      icon: Icons.password,
      obscureText: true,
      maxLines: 1,
      label: label,
      textInputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value == '') {
          return 'Campo obbligatorio'.hardcoded;
        }
        if (value != null && (value as String).length < 6) {
          return 'La password deve essere lunga almeno 6 caratteri'.hardcoded;
        }
        return null;
      },
    );
  }
}
