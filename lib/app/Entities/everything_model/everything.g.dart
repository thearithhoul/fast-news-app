// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'everything.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EverythingImpl _$$EverythingImplFromJson(Map<String, dynamic> json) =>
    _$EverythingImpl(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );

Map<String, dynamic> _$$EverythingImplToJson(_$EverythingImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
