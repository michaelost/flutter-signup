import 'package:flutter/material.dart';

class PasswordValidator extends StatelessWidget {
  final String password;

  PasswordValidator({required this.password});

  bool get hasMinLength => password.length >= 8;
  bool get hasUppercase => password.contains(RegExp(r'[A-Z]'));
  bool get hasDigit => password.contains(RegExp(r'\d'));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildValidationItem(
          'Has at least 8 characters (no spaces)',
          hasMinLength,
        ),
        _buildValidationItem(
          'Uppercase and lowercase letters',
          hasUppercase,
        ),
        _buildValidationItem(
          '1 digit minimum',
          hasDigit,
        ),
      ],
    );
  }

  Widget _buildValidationItem(String message, bool isValid) {
    return Text(
      message,
      style: TextStyle(
        color: isValid ? Colors.green : Colors.red,
        fontSize: 12,
      ),
    );
  }
}
