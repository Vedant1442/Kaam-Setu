import 'package:freezed_annotation/freezed_annotation.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
class Job with _$Job {
  const factory Job({
    required String id,
    required String householdId,
    required String title,
    required String description,
    required String category,
    required double budget,
    required DateTime jobDate,
    required double latitude,
    required double longitude,
    @Default('OPEN') String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}
