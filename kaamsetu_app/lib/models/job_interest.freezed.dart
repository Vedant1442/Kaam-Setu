// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_interest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobInterest _$JobInterestFromJson(Map<String, dynamic> json) {
  return _JobInterest.fromJson(json);
}

/// @nodoc
mixin _$JobInterest {
  String get id => throw _privateConstructorUsedError;
  String get jobId => throw _privateConstructorUsedError;
  String get workerId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  User? get worker => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this JobInterest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobInterest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobInterestCopyWith<JobInterest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobInterestCopyWith<$Res> {
  factory $JobInterestCopyWith(
          JobInterest value, $Res Function(JobInterest) then) =
      _$JobInterestCopyWithImpl<$Res, JobInterest>;
  @useResult
  $Res call(
      {String id,
      String jobId,
      String workerId,
      String status,
      User? worker,
      DateTime? createdAt});

  $UserCopyWith<$Res>? get worker;
}

/// @nodoc
class _$JobInterestCopyWithImpl<$Res, $Val extends JobInterest>
    implements $JobInterestCopyWith<$Res> {
  _$JobInterestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobInterest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobId = null,
    Object? workerId = null,
    Object? status = null,
    Object? worker = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: null == workerId
          ? _value.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      worker: freezed == worker
          ? _value.worker
          : worker // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of JobInterest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get worker {
    if (_value.worker == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.worker!, (value) {
      return _then(_value.copyWith(worker: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JobInterestImplCopyWith<$Res>
    implements $JobInterestCopyWith<$Res> {
  factory _$$JobInterestImplCopyWith(
          _$JobInterestImpl value, $Res Function(_$JobInterestImpl) then) =
      __$$JobInterestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String jobId,
      String workerId,
      String status,
      User? worker,
      DateTime? createdAt});

  @override
  $UserCopyWith<$Res>? get worker;
}

/// @nodoc
class __$$JobInterestImplCopyWithImpl<$Res>
    extends _$JobInterestCopyWithImpl<$Res, _$JobInterestImpl>
    implements _$$JobInterestImplCopyWith<$Res> {
  __$$JobInterestImplCopyWithImpl(
      _$JobInterestImpl _value, $Res Function(_$JobInterestImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobInterest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobId = null,
    Object? workerId = null,
    Object? status = null,
    Object? worker = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$JobInterestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: null == workerId
          ? _value.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      worker: freezed == worker
          ? _value.worker
          : worker // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobInterestImpl implements _JobInterest {
  const _$JobInterestImpl(
      {required this.id,
      required this.jobId,
      required this.workerId,
      this.status = 'PENDING',
      this.worker,
      this.createdAt});

  factory _$JobInterestImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobInterestImplFromJson(json);

  @override
  final String id;
  @override
  final String jobId;
  @override
  final String workerId;
  @override
  @JsonKey()
  final String status;
  @override
  final User? worker;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'JobInterest(id: $id, jobId: $jobId, workerId: $workerId, status: $status, worker: $worker, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobInterestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.worker, worker) || other.worker == worker) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, jobId, workerId, status, worker, createdAt);

  /// Create a copy of JobInterest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobInterestImplCopyWith<_$JobInterestImpl> get copyWith =>
      __$$JobInterestImplCopyWithImpl<_$JobInterestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobInterestImplToJson(
      this,
    );
  }
}

abstract class _JobInterest implements JobInterest {
  const factory _JobInterest(
      {required final String id,
      required final String jobId,
      required final String workerId,
      final String status,
      final User? worker,
      final DateTime? createdAt}) = _$JobInterestImpl;

  factory _JobInterest.fromJson(Map<String, dynamic> json) =
      _$JobInterestImpl.fromJson;

  @override
  String get id;
  @override
  String get jobId;
  @override
  String get workerId;
  @override
  String get status;
  @override
  User? get worker;
  @override
  DateTime? get createdAt;

  /// Create a copy of JobInterest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobInterestImplCopyWith<_$JobInterestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
