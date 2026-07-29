import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user.dart';
import '../../../core/api/api_client.dart';
import '../data/profile_api.dart';
import '../../auth/providers/auth_provider.dart';

final profileApiProvider = Provider((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ProfileApi(apiClient.dio);
});

// Profile State Class
class ProfileState {
  final bool isLoading;
  final User? profile;
  final String? error;

  ProfileState({this.isLoading = false, this.profile, this.error});

  ProfileState copyWith({bool? isLoading, User? profile, String? error, bool clearError = false}) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileApi _api;
  final Ref _ref;

  ProfileNotifier(this._api, this._ref) : super(ProfileState()) {
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final profile = await _api.getMyProfile();
      state = state.copyWith(isLoading: false, profile: profile);
      
      // Sync auth state user with fetched profile
      _ref.read(authProvider.notifier).state = _ref.read(authProvider).copyWith(user: profile);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> saveWorkerProfile(List<String> skills, double wage) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _api.updateWorkerProfile({
        'skills': skills,
        'expectedWage': wage,
      });
      await fetchProfile(); // refresh full profile
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> saveHouseholdProfile(String address) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _api.updateHouseholdProfile({
        'addressLine': address,
      });
      await fetchProfile(); // refresh full profile
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<void> toggleAvailability(bool isAvailable) async {
    try {
      await _api.updateAvailability(isAvailable);
      await fetchProfile();
    } catch (e) {
      state = state.copyWith(error: 'Failed to update availability');
    }
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  final api = ref.watch(profileApiProvider);
  return ProfileNotifier(api, ref);
});
