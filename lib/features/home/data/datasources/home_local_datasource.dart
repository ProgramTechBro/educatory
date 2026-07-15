import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../courses/domain/entities/course_entity.dart';
import '../../domain/entities/live_subject_entity.dart';
import '../../domain/entities/tutor_entity.dart';

class HomeLocalDataSource {
  List<LiveSubjectEntity> getLiveSubjects() {
    return const [
      LiveSubjectEntity(
        title: 'Mat 116',
        tutorCount: '19 Tutor',
        iconAsset: AppIcons.subjectMath,
        gradient: AppColors.gradientRed,
      ),
      LiveSubjectEntity(
        title: 'Arch 116',
        tutorCount: '15 Tutor',
        iconAsset: AppIcons.subjectArchitecture,
        gradient: AppColors.gradientBlue,
      ),
      LiveSubjectEntity(
        title: 'Chem 116',
        tutorCount: '21 Tutor',
        iconAsset: AppIcons.subjectChemistry,
        gradient: AppColors.gradientPurple,
      ),
      LiveSubjectEntity(
        title: 'Bio 120',
        tutorCount: '13 Tutor',
        iconAsset: AppIcons.subjectBiology,
        gradient: AppColors.gradientGreen,
      ),
      LiveSubjectEntity(
        title: 'Phy 110',
        tutorCount: '08 Tutor',
        iconAsset: AppIcons.subjectPhysics,
        gradient: AppColors.gradientGolden,
      ),
      LiveSubjectEntity(
        title: 'CS 201',
        tutorCount: '11 Tutor',
        iconAsset: AppIcons.subjectComputerScience,
        gradient: AppColors.gradientIndigo,
      ),
    ];
  }

  List<CourseEntity> getTrendingCourses() {
    return const [
      CourseEntity(
        image: AppImages.courseFrontEnd,
        title: 'Advanced Front-End Programming Techniques',
        author: 'Julia Anatole',
        duration: '1 hr',
        price: 12.99,
        originalPrice: 36,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.topAuthor,
      ),
      CourseEntity(
        image: AppImages.courseCybersecurity,
        title: 'Ultimate Cybersecurity Fundamental for Beginners',
        author: 'Jacob Jones',
        duration: '3:30 hr',
        price: 12.99,
        originalPrice: 36,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.editorsChoice,
      ),
      CourseEntity(
        image: AppImages.courseUxDesign,
        title: 'Digital User Experience Design Essentials',
        author: 'Cody Fisher',
        duration: '2 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.topAuthor,
      ),
      CourseEntity(
        image: AppImages.courseAi,
        title: 'Artificial Intelligence with Python',
        author: 'Jenny Wilson',
        duration: '1:30 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.editorsChoice,
      ),
      CourseEntity(
        image: AppImages.courseMachineLearning,
        title: 'Machine Learning Algorithms in Practice',
        author: 'Albert Flores',
        duration: '1 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.mostPopular,
      ),
    ];
  }

  List<CourseEntity> getTopNewCourses() {
    return const [
      CourseEntity(
        image: AppImages.coursePhotography,
        title: 'Introduction to Photography and Editing',
        author: 'Eleanor Pena',
        duration: '3 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.bestseller,
      ),
      CourseEntity(
        image: AppImages.coursePublicSpeaking,
        title: 'Mastering Public Speaking and Presentation',
        author: 'Devon Lane',
        duration: '1 hr',
        price: 12.99,
        originalPrice: 36,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.topAuthor,
      ),
      CourseEntity(
        image: AppImages.courseCooking,
        title: 'Cooking Gourmet Meals at Home',
        author: 'Cameron Williamson',
        duration: '2 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.editorsChoice,
      ),
      CourseEntity(
        image: AppImages.courseCreativeWriting,
        title: 'Creative Writing, From Idea to Manuscript',
        author: 'Kristin Watson',
        duration: '50 m',
        price: 12.99,
        originalPrice: 36,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.mostPopular,
      ),
      CourseEntity(
        image: AppImages.coursePersonalFinance,
        title: 'Personal Finance Management Essentials',
        author: 'Arlene McCoy',
        duration: '30 m',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.bestseller,
      ),
    ];
  }

  List<TutorEntity> getTopTutors() {
    return const [
      TutorEntity(
        avatar: AppNetworkImages.tutorAlbert,
        name: 'Albert Flores',
        subject: 'Math 116',
      ),
      TutorEntity(
        avatar: AppNetworkImages.tutorDarrell,
        name: 'Darrell Steward',
        subject: 'Bio 120',
      ),
      TutorEntity(
        avatar: AppNetworkImages.tutorJane,
        name: 'Jane Cooper',
        subject: 'Phy 110',
      ),
      TutorEntity(
        avatar: AppNetworkImages.tutorJulia,
        name: 'Julia Anatole',
        subject: 'Programming',
      ),
    ];
  }
}
