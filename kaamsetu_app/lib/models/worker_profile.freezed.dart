// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkerProfile _$WorkerProfileFromJson(Map<String, dynamic> json) {
  return _WorkerProfile.fromJson(json);
}

/// @nodoc
mixin _$WorkerProfile {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  double? get expectedWage => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  int get thumbsUp => throw _privateConstructorUsedError;
  int get thumbsDown => throw _privateConstructorUsedError;

  /// Serializes this WorkerProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkerProfileCopyWith<WorkerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerProfileCopyWith<$Res> {
  factory $WorkerProfileCopyWith(
          WorkerProfile value, $Res Function(WorkerProfile) then) =
      _$WorkerProfileCopyWithImpl<$Res, WorkerProfile>;
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> skills,
      double? expectedWage,
      bool isAvailable,
      int thumbsUp,
      int thumbsDown});
}

/// @nodoc
class _$WorkerProfileCopyWithImpl<$Res, $Val extends WorkerProfile>
    implements $WorkerProfileCopyWith<$Res> {
  _$WorkerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? skills = null,
    Object? expectedWage = freezed,
    Object? isAvailable = null,
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
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expectedWage: freezed == expectedWage
          ? _value.expectedWage
          : expectedWage // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$WorkerProfileImplCopyWith<$Res>
    implements $WorkerProfileCopyWith<$Res> {
  factory _$$WorkerProfileImplCopyWith(
          _$WorkerProfileImpl value, $Res Function(_$WorkerProfileImpl) then) =
      __$$WorkerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> skills,
      double? expectedWage,
      bool isAvailable,
      int thumbsUp,
      int thumbsDown});
}

/// @nodoc
class __$$WorkerProfileImplCopyWithImpl<$Res>
    extends _$WorkerProfileCopyWithImpl<$Res, _$WorkerProfileImpl>
    implements _$$WorkerProfileImplCopyWith<$Res> {
  __$$WorkerProfileImplCopyWithImpl(
      _$WorkerProfileImpl _value, $Res Function(_$WorkerProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? skills = null,
    Object? expectedWage = freezed,
    Object? isAvailable = null,
    Object? thumbsUp = null,
    Object? thumbsDown = null,
  }) {
    return _then(_$WorkerProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expectedWage: freezed == expectedWage
          ? _value.expectedWage
          : expectedWage // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$WorkerProfileImpl implements _WorkerProfile {
  const _$WorkerProfileImpl(
      {required this.id,
      required this.userId,
      final List<String> skills = const [],
      this.expectedWage,
      this.isAvailable = true,
      this.thumbsUp = 0,
      this.thumbsDown = 0})
      : _skills = skills;

  factory _$WorkerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  final List<String> _skills;
  @override
  @JsonKey()
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final double? expectedWage;
  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final int thumbsUp;
  @override
  @JsonKey()
  final int thumbsDown;

  @override
  String toString() {
    return 'WorkerProfile(id: $id, userId: $userId, skills: $skills, expectedWage: $expectedWage, isAvailable: $isAvailable, thumbsUp: $thumbsUp, thumbsDown: $thumbsDown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.expectedWage, expectedWage) ||
                other.expectedWage == expectedWage) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.thumbsUp, thumbsUp) ||
                other.thumbsUp == thumbsUp) &&
            (identical(other.thumbsDown, thumbsDown) ||
                other.thumbsDown == thumbsDown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      const DeepCollectionEquality().hash(_skills),
      expectedWage,
      isAvailable,
      thumbsUp,
      thumbsDown);

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerProfileImplCopyWith<_$WorkerProfileImpl> get copyWith =>
      __$$WorkerProfileImplCopyWithImpl<_$WorkerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerProfileImplToJson(
      this,
    );
  }
}

abstract class _WorkerProfile implements WorkerProfile {
  const factory _WorkerProfile(
      {required final String id,
      required final String userId,
      final List<String> skills,
      final double? expectedWage,
      final bool isAvailable,
      final int thumbsUp,
      final int thumbsDown}) = _$WorkerProfileImpl;

  factory _WorkerProfile.fromJson(Map<String, dynamic> json) =
      _$WorkerProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  List<String> get skills;
  @override
  double? get expectedWage;
  @override
  bool get isAvailable;
  @override
  int get thumbsUp;
  @override
  int get thumbsDown;

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerProfileImplCopyWith<_$WorkerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
