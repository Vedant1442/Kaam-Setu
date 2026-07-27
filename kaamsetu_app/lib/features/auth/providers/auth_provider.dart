import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/token_storage.dart';

// Providers for dependencies
final tokenStorageProvider = Provider((ref) => TokenStorage());
final apiClientProvider = Provider((ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  return ApiClient(tokenStorage: tokenStorage);
});

// Auth State Class
class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;

  AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, User? user, String? error, bool clearError = false}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

// Auth Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final ApiClient _apiClient;
  final TokenStorage _tokenStorage;

  AuthNotifier(this._apiClient, this._tokenStorage) : super(AuthState());

  Future<void> sendOtp(String phone) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _apiClient.dio.post('/auth/send-otp', data: {'phone': phone});
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> verifyOtp(String phone, String otp) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final response = await _apiClient.dio.post('/auth/verify-otp', data: {
        'phone': phone,
        'otp': otp,
      });
      
      final data = response.data['data'];
      await _tokenStorage.saveTokens(data['tokens']['accessToken'], data['tokens']['refreshToken']);
      
      final user = User.fromJson(data['user']);
      state = state.copyWith(isLoading: false, user: user);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    await _tokenStorage.clearTokens();
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthNotifier(apiClient, tokenStorage);
});
