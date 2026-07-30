// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseholdProfileImpl _$$HouseholdProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$HouseholdProfileImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      addressLine: json['addressLine'] as String?,
      thumbsUp: (json['thumbsUp'] as num?)?.toInt() ?? 0,
      thumbsDown: (json['thumbsDown'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$HouseholdProfileImplToJson(
        _$HouseholdProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'addressLine': instance.addressLine,
      'thumbsUp': instance.thumbsUp,
      'thumbsDown': instance.thumbsDown,
    };
