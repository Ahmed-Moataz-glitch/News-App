import 'package:news_app/core/models/article_model.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class NewsApiResponse {
  final String status;
  final int totalResults;
  final List<Article>? articles;

  const NewsApiResponse({
    required this.status,
    required this.totalResults,
    this.articles,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'status': status,
  //     'totalResults': totalResults,
  //     'articles': articles!.map((x) => x.toMap()).toList(),
  //   };
  // }

  // factory NewsApiResponse.fromMap(Map<String, dynamic> map) {
  //   return NewsApiResponse(
  //     status: map['status'] as String,
  //     totalResults: map['totalResults'] as int,
  //     articles: map['articles'] != null
  //         ? List<Article>.from(
  //             (map['articles'] as List<int>).map<Article?>(
  //               (x) => Article.fromMap(x as Map<String, dynamic>),
  //             ),
  //           )
  //         : null,
  //   );
  // }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'totalResults': totalResults});
    if (articles != null) {
      result.addAll({'articles': articles!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory NewsApiResponse.fromJson(Map<String, dynamic> map) {
    return NewsApiResponse(
      status: map['status'] ?? '',
      totalResults: map['totalResults']?.toInt() ?? 0,
      articles: map['articles'] != null
          ? List<Article>.from(map['articles']?.map((x) => Article.fromMap(x)))
          : null,
    );
  }
}
