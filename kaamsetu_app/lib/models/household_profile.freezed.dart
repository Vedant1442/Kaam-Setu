// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'household_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HouseholdProfile _$HouseholdProfileFromJson(Map<String, dynamic> json) {
  return _HouseholdProfile.fromJson(json);
}

/// @nodoc
mixin _$HouseholdProfile {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get addressLine => throw _privateConstructorUsedError;
  int get thumbsUp => throw _privateConstructorUsedError;
  int get thumbsDown => throw _privateConstructorUsedError;

  /// Serializes this HouseholdProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseholdProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseholdProfileCopyWith<HouseholdProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdProfileCopyWith<$Res> {
  factory $HouseholdProfileCopyWith(
          HouseholdProfile value, $Res Function(HouseholdProfile) then) =
      _$HouseholdProfileCopyWithImpl<$Res, HouseholdProfile>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String? addressLine,
      int thumbsUp,
      int thumbsDown});
}

/// @nodoc
class _$HouseholdProfileCopyWithImpl<$Res, $Val extends HouseholdProfile>
    implements $HouseholdProfileCopyWith<$Res> {
  _$HouseholdProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseholdProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? addressLine = freezed,
    Object? thumbsUp = null,
    Object? thumbsDown = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine: freezed == addressLine
          ? _value.addressLine
          : addressLine // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbsUp: null == thumbsUp
          ? _value.thumbsUp
          : thumbsUp // ignore: cast_nullable_to_non_nullable
              as int,
      thumbsDown: null == thumbsDown
          ? _value.thumbsDown
          : thumbsDown // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdProfileImplCopyWith<$Res>
    implements $HouseholdProfileCopyWith<$Res> {
  factory _$$HouseholdProfileImplCopyWith(_$HouseholdProfileImpl value,
          $Res Function(_$HouseholdProfileImpl) then) =
      __$$HouseholdProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String? addressLine,
      int thumbsUp,
      int thumbsDown});
}

/// @nodoc
class __$$HouseholdProfileImplCopyWithImpl<$Res>
    extends _$HouseholdProfileCopyWithImpl<$Res, _$HouseholdProfileImpl>
    implements _$$HouseholdProfileImplCopyWith<$Res> {
  __$$HouseholdProfileImplCopyWithImpl(_$HouseholdProfileImpl _value,
      $Res Function(_$HouseholdProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseholdProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? addressLine = freezed,
    Object? thumbsUp = null,
    Object? thumbsDown = null,
  }) {
    return _then(_$HouseholdProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine: freezed == addressLine
          ? _value.addressLine
          : addressLine // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbsUp: null == thumbsUp
          ? _value.thumbsUp
          : thumbsUp // ignore: cast_nullable_to_non_nullable
              as int,
      thumbsDown: null == thumbsDown
          ? _value.thumbsDown
          : thumbsDown // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseholdProfileImpl implements _HouseholdProfile {
  const _$HouseholdProfileImpl(
      {required this.id,
      required this.userId,
      this.addressLine,
      this.thumbsUp = 0,
      this.thumbsDown = 0});

  factory _$HouseholdProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseholdProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? addressLine;
  @override
  @JsonKey()
  final int thumbsUp;
  @override
  @JsonKey()
  final int thumbsDown;

  @override
  String toString() {
    return 'HouseholdProfile(id: $id, userId: $userId, addressLine: $addressLine, thumbsUp: $thumbsUp, thumbsDown: $thumbsDown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.addressLine, addressLine) ||
                other.addressLine == addressLine) &&
            (identical(other.thumbsUp, thumbsUp) ||
                other.thumbsUp == thumbsUp) &&
            (identical(other.thumbsDown, thumbsDown) ||
                other.thumbsDown == thumbsDown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, addressLine, thumbsUp, thumbsDown);

  /// Create a copy of HouseholdProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdProfileImplCopyWith<_$HouseholdProfileImpl> get copyWith =>
      __$$HouseholdProfileImplCopyWithImpl<_$HouseholdProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseholdProfileImplToJson(
      this,
    );
  }
}

abstract class _HouseholdProfile implements HouseholdProfile {
  const factory _HouseholdProfile(
      {required final String id,
      required final String userId,
      final String? addressLine,
      final int thumbsUp,
      final int thumbsDown}) = _$HouseholdProfileImpl;

  factory _HouseholdProfile.fromJson(Map<String, dynamic> json) =
      _$HouseholdProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get addressLine;
  @override
  int get thumbsUp;
  @override
  int get thumbsDown;

  /// Create a copy of HouseholdProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseholdProfileImplCopyWith<_$HouseholdProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
