import 'package:flutter/material.dart';
import 'package:newsapp/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }
}

Widget _body(BuildContext context) {
  return Center(
    child: Column(
      children: [
        SizedBox(height: 30),
        Image.asset('assets/images/logo.png', width: 300),
        SizedBox(height: 10),
        _button(context),
      ],
    ),
  );
}

Widget _button(BuildContext context) {
  return OutlinedButton(
    onPressed: () {
      _toLogin(context);
    },
    child: Text('Get Started'),
  );
}

void _toLogin(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
}
