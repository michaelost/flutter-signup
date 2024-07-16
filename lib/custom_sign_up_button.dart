import 'package:flutter/material.dart';

class CustomSignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback onSuccess;

  CustomSignUpButton({
    required this.formKey,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          onSuccess();
        }
      },
      child: Text("Sign up"),
    );
  }
}
