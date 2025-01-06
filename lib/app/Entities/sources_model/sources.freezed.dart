// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sources.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Sources _$SourcesFromJson(Map<String, dynamic> json) {
  return _Sources.fromJson(json);
}

/// @nodoc
mixin _$Sources {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this Sources to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Sources
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourcesCopyWith<Sources> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourcesCopyWith<$Res> {
  factory $SourcesCopyWith(Sources value, $Res Function(Sources) then) =
      _$SourcesCopyWithImpl<$Res, Sources>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? url,
      String? category,
      String? language,
      String? country});
}

/// @nodoc
class _$SourcesCopyWithImpl<$Res, $Val extends Sources>
    implements $SourcesCopyWith<$Res> {
  _$SourcesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sources
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? category = freezed,
    Object? language = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourcesImplCopyWith<$Res> implements $SourcesCopyWith<$Res> {
  factory _$$SourcesImplCopyWith(
          _$SourcesImpl value, $Res Function(_$SourcesImpl) then) =
      __$$SourcesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? url,
      String? category,
      String? language,
      String? country});
}

/// @nodoc
class __$$SourcesImplCopyWithImpl<$Res>
    extends _$SourcesCopyWithImpl<$Res, _$SourcesImpl>
    implements _$$SourcesImplCopyWith<$Res> {
  __$$SourcesImplCopyWithImpl(
      _$SourcesImpl _value, $Res Function(_$SourcesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sources
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? category = freezed,
    Object? language = freezed,
    Object? country = freezed,
  }) {
    return _then(_$SourcesImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourcesImpl implements _Sources {
  const _$SourcesImpl(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  factory _$SourcesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourcesImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? category;
  @override
  final String? language;
  @override
  final String? country;

  @override
  String toString() {
    return 'Sources(id: $id, name: $name, description: $description, url: $url, category: $category, language: $language, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourcesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, url, category, language, country);

  /// Create a copy of Sources
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourcesImplCopyWith<_$SourcesImpl> get copyWith =>
      __$$SourcesImplCopyWithImpl<_$SourcesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourcesImplToJson(
      this,
    );
  }
}

abstract class _Sources implements Sources {
  const factory _Sources(
      {final String? id,
      final String? name,
      final String? description,
      final String? url,
      final String? category,
      final String? language,
      final String? country}) = _$SourcesImpl;

  factory _Sources.fromJson(Map<String, dynamic> json) = _$SourcesImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get category;
  @override
  String? get language;
  @override
  String? get country;

  /// Create a copy of Sources
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourcesImplCopyWith<_$SourcesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
