import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/job.dart';
import '../../../core/api/api_client.dart';
import '../../auth/providers/auth_provider.dart';
import '../data/jobs_api.dart';

final jobsApiProvider = Provider((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return JobsApi(apiClient.dio);
});

// Simple feed provider for now (not paginated for simplicity in this phase)
final jobFeedProvider = FutureProvider.family<List<Job>, Map<String, dynamic>>((ref, filters) async {
  final api = ref.read(jobsApiProvider);
  return api.getNearbyJobs(
    filters['lat'] as double? ?? 0.0, 
    filters['lng'] as double? ?? 0.0, 
    filters['radius'] as int? ?? 10, 
    filters['category'] as String? ?? '',
  );
});

// Job creation notifier
class PostJobNotifier extends StateNotifier<AsyncValue<void>> {
  final JobsApi _api;
  PostJobNotifier(this._api) : super(const AsyncValue.data(null));

  Future<bool> postJob(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      await _api.postJob(data);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

final postJobProvider = StateNotifierProvider<PostJobNotifier, AsyncValue<void>>((ref) {
  return PostJobNotifier(ref.watch(jobsApiProvider));
});
