import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_profile.freezed.dart';
part 'worker_profile.g.dart';

@freezed
class WorkerProfile with _$WorkerProfile {
  const factory WorkerProfile({
    required String id,
    required String userId,
    @Default([]) List<String> skills,
    double? expectedWage,
    @Default(true) bool isAvailable,
    @Default(0) int thumbsUp,
    @Default(0) int thumbsDown,
  }) = _WorkerProfile;

  factory WorkerProfile.fromJson(Map<String, dynamic> json) => _$WorkerProfileFromJson(json);
}
