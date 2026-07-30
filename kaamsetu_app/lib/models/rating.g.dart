// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      id: json['id'] as String,
      jobId: json['jobId'] as String,
      raterId: json['raterId'] as String,
      rateeId: json['rateeId'] as String,
      value: json['value'] as String,
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobId': instance.jobId,
      'raterId': instance.raterId,
      'rateeId': instance.rateeId,
      'value': instance.value,
      'comment': instance.comment,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
