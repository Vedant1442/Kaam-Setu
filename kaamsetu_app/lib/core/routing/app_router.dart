import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'route_names.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/auth/presentation/screens/role_select_screen.dart';
import '../../features/profile/presentation/screens/onboarding_screen.dart';
import '../../features/profile/presentation/screens/worker_profile_screen.dart';
import '../../features/profile/presentation/screens/household_profile_screen.dart';
import '../../features/jobs/presentation/screens/job_feed_screen.dart';
import '../../features/jobs/presentation/screens/post_job_screen.dart';
import '../../features/jobs/presentation/screens/job_detail_screen.dart';
import '../../features/jobs/presentation/screens/interested_workers_screen.dart';
import '../../features/jobs/presentation/screens/active_job_screen.dart';
import '../../features/ratings/presentation/screens/rating_screen.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/otp',
        name: RouteNames.otp,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: '/role_select',
        name: RouteNames.roleSelect,
        builder: (context, state) => const RoleSelectScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/worker_profile',
        name: RouteNames.workerProfile,
        builder: (context, state) => const WorkerProfileScreen(),
      ),
      GoRoute(
        path: '/household_profile',
        name: RouteNames.householdProfile,
        builder: (context, state) => const HouseholdProfileScreen(),
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) => const JobFeedScreen(),
      ),
      GoRoute(
        path: '/post_job',
        builder: (context, state) => const PostJobScreen(),
      ),
      GoRoute(
        path: '/jobs/:id',
        builder: (context, state) => JobDetailScreen(jobId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/jobs/:id/applicants',
        builder: (context, state) => InterestedWorkersScreen(jobId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/jobs/:id/active',
        builder: (context, state) => ActiveJobScreen(jobId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/jobs/:id/rate',
        builder: (context, state) => RatingScreen(jobId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
    ],
  );
});
