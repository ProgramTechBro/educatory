import 'package:go_router/go_router.dart';
import '../features/auth/domain/entities/auth_mode.dart';
import '../features/auth/domain/entities/otp_purpose.dart';
import '../features/auth/presentation/congrats_screen.dart';
import '../features/auth/presentation/education_screen.dart';
import '../features/auth/presentation/full_name_email_screen.dart';
import '../features/auth/presentation/otp_verification_screen.dart';
import '../features/auth/presentation/phone_auth_screen.dart';
import '../features/auth/presentation/reset_password_screen.dart';
import '../features/auth/presentation/role_selection_screen.dart';
import '../features/auth/presentation/set_new_password_screen.dart';
import '../features/auth/presentation/upload_photo_screen.dart';
import '../features/courses/domain/entities/search_target.dart';
import '../features/courses/presentation/all_courses_screen.dart';
import '../features/courses/presentation/all_live_subjects_screen.dart';
import '../features/courses/presentation/filter_screen.dart';
import '../features/courses/presentation/filtered_results_screen.dart';
import '../features/courses/presentation/request_new_subject_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/notifications/presentation/notifications_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/profile/domain/entities/review_entity.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/profile/presentation/reviews_screen.dart';
import '../features/splash/presentation/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.roleSelection,
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerPhone,
        builder: (context, state) =>
            const PhoneAuthScreen(mode: AuthMode.register),
      ),
      GoRoute(
        path: AppRoutes.registerOtp,
        builder: (context, state) => _buildOtpScreen(state),
      ),
      GoRoute(
        path: AppRoutes.registerNameEmail,
        builder: (context, state) => const FullNameEmailScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerEducation,
        builder: (context, state) => const EducationScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerPhoto,
        builder: (context, state) => const UploadPhotoScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerCongrats,
        builder: (context, state) => const CongratsScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginPhone,
        builder: (context, state) => const PhoneAuthScreen(mode: AuthMode.login),
      ),
      GoRoute(
        path: AppRoutes.loginOtp,
        builder: (context, state) => _buildOtpScreen(state),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.resetPasswordOtp,
        builder: (context, state) => _buildOtpScreen(state),
      ),
      GoRoute(
        path: AppRoutes.resetPasswordNew,
        builder: (context, state) => const SetNewPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.filter,
        builder: (context, state) => FilterScreen(
          initialTarget: state.extra as SearchTarget? ?? SearchTarget.tutors,
        ),
      ),
      GoRoute(
        path: AppRoutes.filteredResults,
        builder: (context, state) => _buildFilteredResultsScreen(state),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.reviews,
        builder: (context, state) => ReviewsScreen(
          filter: state.extra as ReviewTargetType?,
        ),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: AppRoutes.allLiveSubjects,
        builder: (context, state) => const AllLiveSubjectsScreen(),
      ),
      GoRoute(
        path: AppRoutes.requestNewSubject,
        builder: (context, state) => const RequestNewSubjectScreen(),
      ),
      GoRoute(
        path: AppRoutes.allCourses,
        builder: (context, state) => const AllCoursesScreen(),
      ),
    ],
  );

  static OtpVerificationScreen _buildOtpScreen(GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    return OtpVerificationScreen(
      purpose: extra?['purpose'] as OtpPurpose? ?? OtpPurpose.register,
      phone: extra?['phone'] as String? ?? '555-0113',
    );
  }

  static FilteredResultsScreen _buildFilteredResultsScreen(GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    return FilteredResultsScreen(
      target: extra?['target'] as SearchTarget? ?? SearchTarget.tutors,
      filterCount: extra?['filterCount'] as int? ?? 5,
    );
  }
}
