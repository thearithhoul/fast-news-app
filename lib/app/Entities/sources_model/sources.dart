import 'package:freezed_annotation/freezed_annotation.dart';

part 'sources.freezed.dart';
part 'sources.g.dart';

@freezed
class Sources with _$Sources {
  const factory Sources({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) = _Sources;

  factory Sources.fromJson(Map<String, Object?> json) =>
      _$SourcesFromJson(json);
}
