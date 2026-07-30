import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'job_interest.freezed.dart';
part 'job_interest.g.dart';

@freezed
class JobInterest with _$JobInterest {
  const factory JobInterest({
    required String id,
    required String jobId,
    required String workerId,
    @Default('PENDING') String status,
    User? worker,
    DateTime? createdAt,
  }) = _JobInterest;

  factory JobInterest.fromJson(Map<String, dynamic> json) => _$JobInterestFromJson(json);
}
