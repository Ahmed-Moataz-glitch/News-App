import 'dart:convert';
import 'package:hive/hive.dart';

part 'article_model.g.dart';

@HiveType(typeId: 0)
class Article extends HiveObject {
  @HiveField(0)
  final Source? source;
  @HiveField(1)
  final String? author;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? url;
  @HiveField(5)
  final String? urlToImage;
  @HiveField(6)
  final String? publishedAt;
  @HiveField(7)
  final String? content;
  @HiveField(8)
  final bool isFavorite;

  Article(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    {this.isFavorite = false}
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      map['source'] != null
          ? Source.fromMap(map['source'] as Map<String, dynamic>)
          : null,
      map['author'] != null ? map['author'] as String : null,
      map['title'] != null ? map['title'] as String : null,
      map['description'] != null ? map['description'] as String : null,
      map['url'] != null ? map['url'] as String : null,
      map['urlToImage'] != null ? map['urlToImage'] as String : null,
      map['publishedAt'] != null ? map['publishedAt'] as String : null,
      map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source) as Map<String, dynamic>);

  Article copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
    bool? isFavorite,
  }) {
    return Article(
      source ?? this.source,
      author ?? this.author,
      title ?? this.title,
      description ?? this.description,
      url ?? this.url,
      urlToImage ?? this.urlToImage,
      publishedAt ?? this.publishedAt,
      content ?? this.content,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

@HiveType(typeId: 1)
class Source {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;

  Source(
    this.id, 
    this.name,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name};
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      map['id'] != null ? map['id'] as String : null,
      map['name'] != null ? map['name'] as String : null,
    );
  }
}