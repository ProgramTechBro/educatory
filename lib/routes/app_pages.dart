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
import '../features/cart_and_payment/presentation/order_details_screen.dart';
import '../features/cart_and_payment/presentation/payment_screen.dart';
import '../features/cart_and_payment/presentation/payment_successful_screen.dart';
import '../features/chat/domain/entities/contact_entity.dart';
import '../features/chat/presentation/contact_list_screen.dart';
import '../features/chat/presentation/messages_screen.dart';
import '../features/courses/domain/entities/quiz_question_entity.dart';
import '../features/courses/domain/entities/search_target.dart';
import '../features/courses/presentation/all_courses_screen.dart';
import '../features/courses/presentation/all_live_subjects_screen.dart';
import '../features/courses/presentation/course_detail_screen.dart';
import '../features/courses/presentation/filter_screen.dart';
import '../features/courses/presentation/filtered_results_screen.dart';
import '../features/courses/presentation/my_courses_screen.dart';
import '../features/courses/presentation/playing_course_screen.dart';
import '../features/courses/presentation/quiz_answers_screen.dart';
import '../features/courses/presentation/quiz_results_screen.dart';
import '../features/courses/presentation/quiz_screen.dart';
import '../features/courses/presentation/reading_article_screen.dart';
import '../features/courses/presentation/request_new_subject_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/live_tutoring/presentation/incoming_call_screen.dart';
import '../features/live_tutoring/presentation/live_subject_detail_screen.dart';
import '../features/live_tutoring/presentation/schedule_tutoring_screen.dart';
import '../features/live_tutoring/presentation/session_fallback_screen.dart';
import '../features/live_tutoring/presentation/session_processing_screen.dart';
import '../features/live_tutoring/presentation/session_request_screen.dart';
import '../features/live_tutoring/presentation/tutor_detail_screen.dart';
import '../features/live_tutoring/presentation/video_call_screen.dart';
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
      GoRoute(
        path: AppRoutes.courseDetail,
        builder: (context, state) => const CourseDetailScreen(),
      ),
      GoRoute(
        path: AppRoutes.orderDetails,
        builder: (context, state) => const OrderDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.payment,
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: AppRoutes.paymentSuccessful,
        builder: (context, state) => const PaymentSuccessfulScreen(),
      ),
      GoRoute(
        path: AppRoutes.myCourses,
        builder: (context, state) => const MyCoursesScreen(),
      ),
      GoRoute(
        path: AppRoutes.playingCourse,
        builder: (context, state) => const PlayingCourseScreen(),
      ),
      GoRoute(
        path: AppRoutes.readingArticle,
        builder: (context, state) => const ReadingArticleScreen(),
      ),
      GoRoute(
        path: AppRoutes.quiz,
        builder: (context, state) => const QuizScreen(),
      ),
      GoRoute(
        path: AppRoutes.quizResults,
        builder: (context, state) => _buildQuizResultsScreen(state),
      ),
      GoRoute(
        path: AppRoutes.quizAnswers,
        builder: (context, state) => _buildQuizAnswersScreen(state),
      ),
      GoRoute(
        path: AppRoutes.liveSubjectDetail,
        builder: (context, state) => const LiveSubjectDetailScreen(),
      ),
      GoRoute(
        path: AppRoutes.tutorDetail,
        builder: (context, state) => const TutorDetailScreen(),
      ),
      GoRoute(
        path: AppRoutes.scheduleTutoring,
        builder: (context, state) => const ScheduleTutoringScreen(),
      ),
      GoRoute(
        path: AppRoutes.bookingOrderDetails,
        builder: (context, state) => const OrderDetailsScreen(isSession: true),
      ),
      GoRoute(
        path: AppRoutes.bookingPayment,
        builder: (context, state) => const PaymentScreen(isSession: true),
      ),
      GoRoute(
        path: AppRoutes.bookingSuccessful,
        builder: (context, state) =>
            const PaymentSuccessfulScreen(isSession: true),
      ),
      GoRoute(
        path: AppRoutes.contactList,
        builder: (context, state) => const ContactListScreen(),
      ),
      GoRoute(
        path: AppRoutes.chat,
        builder: (context, state) =>
            MessagesScreen(contact: state.extra as ContactEntity),
      ),
      GoRoute(
        path: AppRoutes.sessionRequest,
        builder: (context, state) => const SessionRequestScreen(),
      ),
      GoRoute(
        path: AppRoutes.sessionProcessing,
        builder: (context, state) => const SessionProcessingScreen(),
      ),
      GoRoute(
        path: AppRoutes.sessionFallback,
        builder: (context, state) => const SessionFallbackScreen(),
      ),
      GoRoute(
        path: AppRoutes.incomingCall,
        builder: (context, state) => const IncomingCallScreen(),
      ),
      GoRoute(
        path: AppRoutes.videoCall,
        builder: (context, state) => const VideoCallScreen(),
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

  static QuizResultsScreen _buildQuizResultsScreen(GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    return QuizResultsScreen(
      questions: extra['questions'] as List<QuizQuestionEntity>,
      answers: extra['answers'] as Map<int, Set<int>>,
      score: extra['score'] as int,
    );
  }

  static QuizAnswersScreen _buildQuizAnswersScreen(GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    return QuizAnswersScreen(
      questions: extra['questions'] as List<QuizQuestionEntity>,
      answers: extra['answers'] as Map<int, Set<int>>,
    );
  }
}
