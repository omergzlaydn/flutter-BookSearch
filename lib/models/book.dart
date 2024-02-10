// models/book.dart

class Book {
  final String id;
  final VolumeInfo volumeInfo;

  Book({required this.id, required this.volumeInfo});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
    );
  }
}

class VolumeInfo {
  final String title;
  final List<String> authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;

  VolumeInfo({
    required this.title,
    required this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      title: json['title'],
      authors: List<String>.from(json['authors']),
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
    );
  }
}
