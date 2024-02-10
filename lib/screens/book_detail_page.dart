import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final Map<String, dynamic> book;

  BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['volumeInfo']['title']),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Başlık: ${book['volumeInfo']['title']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Yazarlar: ${book['volumeInfo']['authors'].join(', ')}',
            ),
            SizedBox(height: 8.0),
            Text(
              'Yayınevi: ${book['volumeInfo']['publisher'] ?? 'Bilinmiyor'}',
            ),
            SizedBox(height: 8.0),
            Text(
              'Yayın Tarihi: ${book['volumeInfo']['publishedDate'] ?? 'Bilinmiyor'}',
            ),
            SizedBox(height: 8.0),
            Text(
              'Açıklama: ${book['volumeInfo']['description'] ?? 'Açıklama mevcut değil.'}',
            ),
          ],
        ),
      ),
    );
  }
}
