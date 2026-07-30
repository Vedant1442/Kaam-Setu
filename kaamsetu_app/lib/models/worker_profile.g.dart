// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkerProfileImpl _$$WorkerProfileImplFromJson(Map<String, dynamic> json) =>
    _$WorkerProfileImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      expectedWage: (json['expectedWage'] as num?)?.toDouble(),
      isAvailable: json['isAvailable'] as bool? ?? true,
      thumbsUp: (json['thumbsUp'] as num?)?.toInt() ?? 0,
      thumbsDown: (json['thumbsDown'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WorkerProfileImplToJson(_$WorkerProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'skills': instance.skills,
      'expectedWage': instance.expectedWage,
      'isAvailable': instance.isAvailable,
      'thumbsUp': instance.thumbsUp,
      'thumbsDown': instance.thumbsDown,
    };
