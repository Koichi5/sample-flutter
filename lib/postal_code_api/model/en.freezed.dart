// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'en.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

En _$EnFromJson(Map<String, dynamic> json) {
  return _En.fromJson(json);
}

/// @nodoc
mixin _$En {
  String get prefecture => throw _privateConstructorUsedError;
  String get address1 => throw _privateConstructorUsedError;
  String get address2 => throw _privateConstructorUsedError;
  String get address3 => throw _privateConstructorUsedError;
  String get address4 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnCopyWith<En> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnCopyWith<$Res> {
  factory $EnCopyWith(En value, $Res Function(En) then) =
      _$EnCopyWithImpl<$Res, En>;
  @useResult
  $Res call(
      {String prefecture,
      String address1,
      String address2,
      String address3,
      String address4});
}

/// @nodoc
class _$EnCopyWithImpl<$Res, $Val extends En> implements $EnCopyWith<$Res> {
  _$EnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefecture = null,
    Object? address1 = null,
    Object? address2 = null,
    Object? address3 = null,
    Object? address4 = null,
  }) {
    return _then(_value.copyWith(
      prefecture: null == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String,
      address1: null == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      address3: null == address3
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String,
      address4: null == address4
          ? _value.address4
          : address4 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnImplCopyWith<$Res> implements $EnCopyWith<$Res> {
  factory _$$EnImplCopyWith(_$EnImpl value, $Res Function(_$EnImpl) then) =
      __$$EnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String prefecture,
      String address1,
      String address2,
      String address3,
      String address4});
}

/// @nodoc
class __$$EnImplCopyWithImpl<$Res> extends _$EnCopyWithImpl<$Res, _$EnImpl>
    implements _$$EnImplCopyWith<$Res> {
  __$$EnImplCopyWithImpl(_$EnImpl _value, $Res Function(_$EnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefecture = null,
    Object? address1 = null,
    Object? address2 = null,
    Object? address3 = null,
    Object? address4 = null,
  }) {
    return _then(_$EnImpl(
      prefecture: null == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String,
      address1: null == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      address3: null == address3
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String,
      address4: null == address4
          ? _value.address4
          : address4 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnImpl extends _En {
  const _$EnImpl(
      {required this.prefecture,
      required this.address1,
      required this.address2,
      required this.address3,
      required this.address4})
      : super._();

  factory _$EnImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnImplFromJson(json);

  @override
  final String prefecture;
  @override
  final String address1;
  @override
  final String address2;
  @override
  final String address3;
  @override
  final String address4;

  @override
  String toString() {
    return 'En(prefecture: $prefecture, address1: $address1, address2: $address2, address3: $address3, address4: $address4)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnImpl &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.address3, address3) ||
                other.address3 == address3) &&
            (identical(other.address4, address4) ||
                other.address4 == address4));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, prefecture, address1, address2, address3, address4);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnImplCopyWith<_$EnImpl> get copyWith =>
      __$$EnImplCopyWithImpl<_$EnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnImplToJson(
      this,
    );
  }
}

abstract class _En extends En {
  const factory _En(
      {required final String prefecture,
      required final String address1,
      required final String address2,
      required final String address3,
      required final String address4}) = _$EnImpl;
  const _En._() : super._();

  factory _En.fromJson(Map<String, dynamic> json) = _$EnImpl.fromJson;

  @override
  String get prefecture;
  @override
  String get address1;
  @override
  String get address2;
  @override
  String get address3;
  @override
  String get address4;
  @override
  @JsonKey(ignore: true)
  _$$EnImplCopyWith<_$EnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
