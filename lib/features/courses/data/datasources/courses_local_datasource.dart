import '../../../../config/app_assets.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/entities/tutor_result_entity.dart';

class CoursesLocalDataSource {
  List<TutorResultEntity> getFilteredTutors() {
    return const [
      TutorResultEntity(
        avatar: AppNetworkImages.resultTutorEleanor,
        name: 'Eleanor Pena',
        institution: 'Københavns Universitet',
        rating: 5.0,
        ratingCount: 41,
        hourlyRate: 30,
        originalHourlyRate: 36,
      ),
      TutorResultEntity(
        avatar: AppNetworkImages.resultTutorRobert,
        name: 'Robert Fox',
        institution: 'University of Oxford',
        rating: 4.5,
        ratingCount: 39,
        hourlyRate: 30,
        originalHourlyRate: 36,
      ),
      TutorResultEntity(
        avatar: AppNetworkImages.resultTutorDianne,
        name: 'Dianne Russell',
        institution: 'Sydansk Universitet',
        rating: 4.4,
        ratingCount: 27,
        hourlyRate: 30,
        originalHourlyRate: 36,
      ),
      TutorResultEntity(
        avatar: AppNetworkImages.resultTutorGuy,
        name: 'Guy Hawkins',
        institution: 'Aarhus Universitet',
        rating: 4.2,
        ratingCount: 21,
        hourlyRate: 30,
        originalHourlyRate: 36,
      ),
      TutorResultEntity(
        avatar: AppNetworkImages.resultTutorJulia,
        name: 'Julia Anatole',
        institution: 'Harvard Business School',
        rating: 4.0,
        ratingCount: 17,
        hourlyRate: 30,
        originalHourlyRate: 36,
      ),
      TutorResultEntity(
        avatar: AppNetworkImages.resultTutorAlbert,
        name: 'Albert Flores',
        institution: 'Wake Forest University',
        rating: 3.9,
        ratingCount: 14,
        hourlyRate: 30,
        originalHourlyRate: 36,
      ),
    ];
  }

  List<CourseEntity> getFilteredCourses() {
    return const [
      CourseEntity(
        image: AppImages.resultCourseJavascript,
        title: 'JavaScript for Modern Web Development',
        author: 'Robert Fox',
        duration: '3 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.topAuthor,
      ),
      CourseEntity(
        image: AppImages.resultCoursePython,
        title: 'Python Programming for Data Analysis',
        author: 'Eleanor Pena',
        duration: '3 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.topAuthor,
      ),
      CourseEntity(
        image: AppImages.resultCourseHtmlCss,
        title: 'Building Responsive Websites with HTML & CSS',
        author: 'Matthew Hyden',
        duration: '3 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.editorsChoice,
      ),
      CourseEntity(
        image: AppImages.resultCourseAlgorithms,
        title: 'Advanced Algorithms and Data Structures',
        author: 'Norman Flex',
        duration: '3 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.editorsChoice,
      ),
      CourseEntity(
        image: AppImages.resultCourseMobileApp,
        title: 'Introduction to Mobile App Development',
        author: 'Jacob Jones',
        duration: '3 hr',
        price: 10.99,
        originalPrice: 32,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.editorsChoice,
      ),
    ];
  }
}
