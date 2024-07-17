import 'package:flutter/material.dart';
import 'password_validator.dart';
import 'custom_text_form_field.dart';

class PasswordFieldWithValidator extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;

  PasswordFieldWithValidator({
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
  });

  bool isPasswordValid(String password) {
    return password.length >= 8 &&
           password.contains(RegExp(r'[A-Z]')) &&
           password.contains(RegExp(r'\d'));
  }

  @override
  _PasswordFieldWithValidatorState createState() => _PasswordFieldWithValidatorState();
}

class _PasswordFieldWithValidatorState extends State<PasswordFieldWithValidator> {
  String _password = '';

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updatePassword);
  }

  void _updatePassword() {
    setState(() {
      _password = widget.controller.text;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updatePassword);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          controller: widget.controller,
          labelText: widget.labelText,
          hintText: widget.hintText,
          obscureText: true,
          validator: widget.validator,
        ),
        SizedBox(height: 10),
        PasswordValidator(password: _password),
      ],
    );
  }
}
