import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class Item extends StatefulWidget {
  final Article article;
  const Item({super.key, required this.article});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.network(
                widget.article.urlToImage ?? 'assets/images/null_image.avif',
                width: double.infinity,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.article.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.article.description,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 15,
                letterSpacing: 0.8,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                await launchUrl(
                  Uri.parse(widget.article.url),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: Text('Click to visit'),
            ),
          ],
        ),
      ),
    );
  }
}
