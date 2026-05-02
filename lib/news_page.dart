import 'package:flutter/material.dart';
import 'package:newsapp/login.dart';
import 'package:newsapp/services/new_service.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  StatefulWidget login = Login();
  NewService newService = NewService();
  String text = 'locomotive';
  @override
  void initState() {
     final newPageState = newService.getHeadlines();
    super.initState();
  }
   
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Page')),

      // drawer: Drawer(),
      body: ListView.builder(
        itemCount: ,
        itemBuilder: (context, index) {}
      ), // a
      bottomNavigationBar: Text('bottom nav'),
    );
  }
}
