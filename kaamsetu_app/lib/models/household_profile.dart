import 'package:freezed_annotation/freezed_annotation.dart';

part 'household_profile.freezed.dart';
part 'household_profile.g.dart';

@freezed
class HouseholdProfile with _$HouseholdProfile {
  const factory HouseholdProfile({
    required String id,
    required String userId,
    String? addressLine,
    @Default(0) int thumbsUp,
    @Default(0) int thumbsDown,
  }) = _HouseholdProfile;

  factory HouseholdProfile.fromJson(Map<String, dynamic> json) => _$HouseholdProfileFromJson(json);
}
