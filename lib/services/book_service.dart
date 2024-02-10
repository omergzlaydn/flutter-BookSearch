import 'dart:convert';
import 'package:http/http.dart' as http;

class BookService {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  static Future<List<dynamic>> searchBooks(String query, int startIndex) async {
    try {
      String url = '$baseUrl?q=$query&maxResults=20&startIndex=$startIndex';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['items'];
      } else {
        throw Exception('Failed to search books');
      }
    } catch (e) {
      throw Exception('Failed to search books: $e');
    }
  }

  static Future<Map<String, dynamic>> getBookDetails(String bookId) async {
    try {
      String url = '$baseUrl/$bookId';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to get book details');
      }
    } catch (e) {
      throw Exception('Failed to get book details: $e');
    }
  }
}
