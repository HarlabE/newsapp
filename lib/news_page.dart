import 'package:flutter/material.dart';
import 'package:newsapp/login.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/newsitem.dart';
import 'package:newsapp/services/new_service.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final NewService _newService = NewService();

  late Future<List<Article>> _headlines;
  @override
  void initState() {
    _headlines = _newService.getHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Page')),
      body: FutureBuilder<List<Article>>(
        future: _headlines,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text('${snapshot.error}'),
                  ElevatedButton(onPressed: () {}, child: Text('Retry')),
                ],
              ),
            );
          }
          final articles = snapshot.data!;
          if (articles.isEmpty) {
            return Center(child: Text('No article found'));
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return Item(article: articles[index]);
            },
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemCount: articles.length,
          );
        },
      ),
      bottomNavigationBar: Text('bottom nav'),
    );
  }
}
