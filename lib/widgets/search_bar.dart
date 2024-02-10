import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final List<String> authors;
  final VoidCallback onTap;

  BookCard({
    required this.title,
    required this.authors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(authors.join(', ')),
      onTap: onTap,
    );
  }
}
