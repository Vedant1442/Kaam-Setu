import 'package:dio/dio.dart';
import '../../../models/job.dart';
import '../../../models/job_interest.dart';

class JobsApi {
  final Dio _dio;

  JobsApi(this._dio);

  Future<List<Job>> getNearbyJobs(double lat, double lng, int radius, String category) async {
    final response = await _dio.get('/jobs', queryParameters: {
      'lat': lat,
      'lng': lng,
      'radius': radius,
      'category': category,
    });
    return (response.data['data'] as List).map((e) => Job.fromJson(e)).toList();
  }

  Future<Job> postJob(Map<String, dynamic> data) async {
    final response = await _dio.post('/jobs', data: data);
    return Job.fromJson(response.data['data']);
  }

  Future<Job> getJobDetails(String id) async {
    final response = await _dio.get('/jobs/$id');
    return Job.fromJson(response.data['data']);
  }

  Future<void> expressInterest(String jobId) async {
    await _dio.post('/jobs/$jobId/interest');
  }

  Future<List<JobInterest>> getInterestedWorkers(String jobId) async {
    final response = await _dio.get('/jobs/$jobId/interests');
    return (response.data['data'] as List).map((e) => JobInterest.fromJson(e)).toList();
  }

  Future<void> acceptWorker(String jobId, String interestId) async {
    await _dio.patch('/jobs/$jobId/interests/$interestId', data: {'action': 'ACCEPT'});
  }

  Future<void> updateJobStatus(String jobId, String status) async {
    await _dio.patch('/jobs/$jobId/status', data: {'status': status});
  }
}
