import 'package:flutter/material.dart';
import 'custom_text_form_field.dart'; 
import 'custom_sign_up_button.dart';  

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sign up success'),
          content: Text('You have successfully signed up.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _emailController,
                labelText: "Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: _passwordController,
                labelText: "Password",
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8 || value.length > 64) {
                    return 'Password must be between 8 and 64 characters';
                  }
                  if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
                    return 'Password must contain at least one digit';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomSignUpButton(
                formKey: _formKey,
                onSuccess: _showSuccessDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
