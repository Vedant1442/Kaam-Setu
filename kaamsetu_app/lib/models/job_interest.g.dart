// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_interest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobInterestImpl _$$JobInterestImplFromJson(Map<String, dynamic> json) =>
    _$JobInterestImpl(
      id: json['id'] as String,
      jobId: json['jobId'] as String,
      workerId: json['workerId'] as String,
      status: json['status'] as String? ?? 'PENDING',
      worker: json['worker'] == null
          ? null
          : User.fromJson(json['worker'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$JobInterestImplToJson(_$JobInterestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobId': instance.jobId,
      'workerId': instance.workerId,
      'status': instance.status,
      'worker': instance.worker,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
