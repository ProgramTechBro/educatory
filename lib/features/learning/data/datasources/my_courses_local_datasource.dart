import '../../../../config/app_assets.dart';
import '../../domain/entities/enrolled_course_entity.dart';

class MyCoursesLocalDataSource {
  List<EnrolledCourseEntity> getEnrolledCourses() {
    return const [
      EnrolledCourseEntity(
        id: 'course-1',
        image: AppImages.courseFrontEnd,
        title: 'Advanced Front-End Programming Techniques',
        author: 'Robert Fox',
        duration: '6h 32m',
        price: 30,
        progress: 0.65,
      ),
      EnrolledCourseEntity(
        id: 'course-2',
        image: AppImages.courseAi,
        title: 'Introduction to Artificial Intelligence',
        author: 'Julia Anatole',
        duration: '5h 10m',
        price: 45,
        progress: 0.3,
      ),
      EnrolledCourseEntity(
        id: 'course-3',
        image: AppImages.coursePhotography,
        title: 'Mastering Digital Photography',
        author: 'Guy Hawkins',
        duration: '4h 45m',
        price: 25,
        progress: 1,
      ),
    ];
  }
}
