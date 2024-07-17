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
  bool _obscureText = true;

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

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
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
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: widget.labelText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
          validator: widget.validator,
        ),
        SizedBox(height: 10),
        PasswordValidator(password: _password),
      ],
    );
  }
}
