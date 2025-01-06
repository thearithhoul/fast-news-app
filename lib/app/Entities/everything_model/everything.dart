import 'package:fast_news_application/app/Entities/everything_model/source_model/source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'everything.freezed.dart';

part 'everything.g.dart';

@freezed
class Everything with _$Everything {
  const factory Everything({
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) = _Everything;

  factory Everything.fromJson(Map<String, Object?> json) =>
      _$EverythingFromJson(json);
}
