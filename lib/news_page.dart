import 'package:flutter/material.dart';
import 'package:newsapp/login.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  StatefulWidget login = Login();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('News Page'),
      ),

      // drawer: Drawer(),
      body: Text('News page'),
      bottomNavigationBar: Text('bottom nav'),
    );
  }
}
