// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String?,
      name: json['name'] as String?,
      profilePhotoUrl: json['profilePhotoUrl'] as String?,
      language: json['language'] as String? ?? 'hi',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'role': instance.role,
      'name': instance.name,
      'profilePhotoUrl': instance.profilePhotoUrl,
      'language': instance.language,
    };
