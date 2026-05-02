import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';

class Item extends StatefulWidget {
  final Article article;
  const Item({super.key, required this.article});

  @override
  State<Item> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Card(child: Column(children: [
  Image.network(widget.article.urlToImage),
   Text(widget.article.title),
   Text(widget.article.description),
   Text(widget.article.url),

        ],
      ));
  }
}
