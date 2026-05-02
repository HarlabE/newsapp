import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
  return Center(
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),

        color: Colors.indigo[900],
      ),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(text: TextSpan(
              children: [
                TextSpan(text: 'Login', style: TextStyle(color: Colors.white,fontSize: 20,),)
                
              ]
            )),
            SizedBox(height: 20),
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
    ),
  );
}

Widget _inputField(
  String type,
  FormFieldValidator<String>? validator,
  bool isObscure,
) {
  return TextFormField(
    style: TextStyle(color: Colors.white),
    obscureText: isObscure,
    validator: validator,

    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      label: Text(type, style: TextStyle(color: Colors.white)),
    ),
  );
}

Widget _button(context) {
  return ElevatedButton(
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
