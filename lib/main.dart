// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(booksource());
}

class booksource extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitap Arama Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _books = [];
  int _startIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitap Arama'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Kitap Adı',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _searchBooks(_searchController.text);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_books[index]['volumeInfo']['title']),
                  subtitle:
                      Text(_books[index]['volumeInfo']['authors'].join(', ')),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookDetailPage(book: _books[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_startIndex > 0) {
                    _startIndex -= 20;
                    _searchBooks(_searchController.text);
                  }
                },
                child: Text('Önceki Sayfa'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  _startIndex += 20;
                  _searchBooks(_searchController.text);
                },
                child: Text('Sonraki Sayfa'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _searchBooks(String query) async {
    String url =
        'https://www.googleapis.com/books/v1/volumes?q=$query&maxResults=20&startIndex=$_startIndex';
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    setState(() {
      _books = data['items'];
    });
  }
}

class BookDetailPage extends StatelessWidget {
  final dynamic book;

  BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['volumeInfo']['title']),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Başlık: ${book['volumeInfo']['title']}'),
              Text('Yazarlar: ${book['volumeInfo']['authors'].join(', ')}'),
              Text(
                  'Yayınevi: ${book['volumeInfo']['publisher'] ?? 'Bilinmiyor'}'),
              Text(
                  'Yayın Tarihi: ${book['volumeInfo']['publishedDate'] ?? 'Bilinmiyor'}'),
              Text(
                  'Açıklama: ${book['volumeInfo']['description'] ?? 'Açıklama mevcut değil.'}'),
            ],
          ),
        ),
      ),
    );
  }
}
