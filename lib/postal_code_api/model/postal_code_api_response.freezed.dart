// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postal_code_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostalCodeApiResponse _$PostalCodeApiResponseFromJson(
    Map<String, dynamic> json) {
  return _PostalCodeApiResponse.fromJson(json);
}

/// @nodoc
mixin _$PostalCodeApiResponse {
  String get postalCode => throw _privateConstructorUsedError;
  List<Address>? get addresses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostalCodeApiResponseCopyWith<PostalCodeApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostalCodeApiResponseCopyWith<$Res> {
  factory $PostalCodeApiResponseCopyWith(PostalCodeApiResponse value,
          $Res Function(PostalCodeApiResponse) then) =
      _$PostalCodeApiResponseCopyWithImpl<$Res, PostalCodeApiResponse>;
  @useResult
  $Res call({String postalCode, List<Address>? addresses});
}

/// @nodoc
class _$PostalCodeApiResponseCopyWithImpl<$Res,
        $Val extends PostalCodeApiResponse>
    implements $PostalCodeApiResponseCopyWith<$Res> {
  _$PostalCodeApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postalCode = null,
    Object? addresses = freezed,
  }) {
    return _then(_value.copyWith(
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostalCodeApiResponseImplCopyWith<$Res>
    implements $PostalCodeApiResponseCopyWith<$Res> {
  factory _$$PostalCodeApiResponseImplCopyWith(
          _$PostalCodeApiResponseImpl value,
          $Res Function(_$PostalCodeApiResponseImpl) then) =
      __$$PostalCodeApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postalCode, List<Address>? addresses});
}

/// @nodoc
class __$$PostalCodeApiResponseImplCopyWithImpl<$Res>
    extends _$PostalCodeApiResponseCopyWithImpl<$Res,
        _$PostalCodeApiResponseImpl>
    implements _$$PostalCodeApiResponseImplCopyWith<$Res> {
  __$$PostalCodeApiResponseImplCopyWithImpl(_$PostalCodeApiResponseImpl _value,
      $Res Function(_$PostalCodeApiResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postalCode = null,
    Object? addresses = freezed,
  }) {
    return _then(_$PostalCodeApiResponseImpl(
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: freezed == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostalCodeApiResponseImpl extends _PostalCodeApiResponse {
  const _$PostalCodeApiResponseImpl(
      {required this.postalCode, required final List<Address>? addresses})
      : _addresses = addresses,
        super._();

  factory _$PostalCodeApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostalCodeApiResponseImplFromJson(json);

  @override
  final String postalCode;
  final List<Address>? _addresses;
  @override
  List<Address>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PostalCodeApiResponse(postalCode: $postalCode, addresses: $addresses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostalCodeApiResponseImpl &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, postalCode, const DeepCollectionEquality().hash(_addresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostalCodeApiResponseImplCopyWith<_$PostalCodeApiResponseImpl>
      get copyWith => __$$PostalCodeApiResponseImplCopyWithImpl<
          _$PostalCodeApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostalCodeApiResponseImplToJson(
      this,
    );
  }
}

abstract class _PostalCodeApiResponse extends PostalCodeApiResponse {
  const factory _PostalCodeApiResponse(
      {required final String postalCode,
      required final List<Address>? addresses}) = _$PostalCodeApiResponseImpl;
  const _PostalCodeApiResponse._() : super._();

  factory _PostalCodeApiResponse.fromJson(Map<String, dynamic> json) =
      _$PostalCodeApiResponseImpl.fromJson;

  @override
  String get postalCode;
  @override
  List<Address>? get addresses;
  @override
  @JsonKey(ignore: true)
  _$$PostalCodeApiResponseImplCopyWith<_$PostalCodeApiResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
