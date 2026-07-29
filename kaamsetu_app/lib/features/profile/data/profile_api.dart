import 'package:dio/dio.dart';
import '../../../models/user.dart';
import '../../../models/worker_profile.dart';
import '../../../models/household_profile.dart';

class ProfileApi {
  final Dio _dio;

  ProfileApi(this._dio);

  Future<User> getMyProfile() async {
    final response = await _dio.get('/users/me');
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  Future<User> updateBasicInfo(Map<String, dynamic> data) async {
    final response = await _dio.put('/users/me', data: data);
    return User.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  Future<WorkerProfile> updateWorkerProfile(Map<String, dynamic> data) async {
    final response = await _dio.put('/users/me/worker-profile', data: data);
    return WorkerProfile.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  Future<HouseholdProfile> updateHouseholdProfile(Map<String, dynamic> data) async {
    final response = await _dio.put('/users/me/household-profile', data: data);
    return HouseholdProfile.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  Future<WorkerProfile> updateAvailability(bool isAvailable) async {
    final response = await _dio.patch('/users/me/availability', data: {'isAvailable': isAvailable});
    return WorkerProfile.fromJson(response.data['data'] as Map<String, dynamic>);
  }
}
