import '../../../config/app_assets.dart';
import '../domain/entities/onboarding_page_entity.dart';

const List<OnboardingPageEntity> onboardingPages = [
  OnboardingPageEntity(
    image: AppImages.onboarding1,
    title: 'Welcome to Educatory',
    subtitle:
        "Your go-to platform for live sessions and on-demand courses. We're excited to help you learn and grow!",
  ),
  OnboardingPageEntity(
    image: AppImages.onboarding2,
    title: 'Live Session with Teachers',
    subtitle:
        'Join live with top teachers. Session-based study with real-time feedback and support.',
  ),
  OnboardingPageEntity(
    image: AppImages.onboarding3,
    title: 'Engage with Quizzes',
    subtitle:
        'Test your knowledge with interactive quizzes. Track your progress and reinforce your learning!',
  ),
];
