import 'package:flutter/material.dart';
import 'package:newsapp/news_page.dart';

class Login extends StatefulWidget {
  myMethod() {
    print('THis is working');
  }

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }
}

final _formKey = GlobalKey<FormState>();
Widget? _body(context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    child: Form(
      key: _formKey,
      child: Column(
        children: [
          _inputField('username', (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a correct username';
            }
            return null;
          }, false),
          SizedBox(height: 20),
          _inputField('Email', (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a correct text';
            }
            if (!value.contains('@')) {
              return 'Enter a valid Email';
            }
            return null;
          }, false),
          SizedBox(height: 20),
          _inputField('Password', (value) {
            if (value!.length <= 8) {
              return 'Password incorrect';
            }
            return null;
          }, true),
          SizedBox(height: 20),
          _button(context),
        ],
      ),
    ),
  );
}

Widget _inputField(
  String type,
  FormFieldValidator<String>? validator,
  bool isObscure,
) {
  return TextFormField(
    obscureText: isObscure,
    validator: validator,
    decoration: InputDecoration(label: Text(type)),
  );
}

Widget _button(context) {
  return OutlinedButton(
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login successful")));
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => NewPage()));
      }
    },
    child: Text("Sign In"),
  );
}
