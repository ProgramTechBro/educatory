import 'package:flutter/material.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../domain/entities/course_author_entity.dart';
import '../../domain/entities/course_detail_entity.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/entities/course_module_entity.dart';
import '../../domain/entities/course_review_entity.dart';

class CourseDetailLocalDataSource {
  CourseDetailEntity getCourseDetail() {
    return const CourseDetailEntity(
      course: CourseEntity(
        image: AppImages.courseFrontEnd,
        title: 'Advanced Front-End Programming Techniques',
        author: 'Julia Anatole',
        duration: '1hr',
        price: 12.99,
        originalPrice: 36,
        rating: 4.5,
        ratingCount: 2980,
        badge: CourseBadgeType.topAuthor,
      ),
      description:
          "The Advanced Front-End Programming course sharpens students' "
          'critical thinking, creativity, and analytical skills, empowering '
          'them to effectively tackle complex challenges in web '
          'development.',
      includes: [
        CourseIncludeEntity(icon: Icons.all_inclusive, label: 'Lifetime access'),
        CourseIncludeEntity(
          icon: Icons.description_outlined,
          label: '23 Readings',
        ),
        CourseIncludeEntity(
          icon: Icons.assignment_outlined,
          label: '39 Assignments',
        ),
        CourseIncludeEntity(
          icon: Icons.workspace_premium_outlined,
          label: 'Certificate of Achievement',
        ),
        CourseIncludeEntity(
          icon: Icons.download_outlined,
          label: '54 Downloadable item',
        ),
      ],
      modules: [
        CourseModuleEntity(
          title: 'HTML and CSS Basics',
          meta: '4:30',
          type: CourseModuleType.video,
          isCompleted: true,
        ),
        CourseModuleEntity(
          title: 'JavaScript & DOM',
          meta: '5:15',
          type: CourseModuleType.video,
        ),
        CourseModuleEntity(
          title: 'Responsive Design',
          meta: '2:40',
          type: CourseModuleType.reading,
        ),
        CourseModuleEntity(
          title: 'Advanced JavaScript',
          meta: '6:28',
          type: CourseModuleType.video,
        ),
        CourseModuleEntity(
          title: 'Assignements',
          meta: '5 Questions',
          type: CourseModuleType.assignment,
        ),
        CourseModuleEntity(
          title: 'React UI Building',
          meta: '4:50',
          type: CourseModuleType.video,
        ),
      ],
    );
  }

  List<CourseReviewEntity> getCourseReviews() {
    return const [
      CourseReviewEntity(
        avatar: AppNetworkImages.resultTutorAlbert,
        reviewerName: 'Brooklyn Simmons',
        rating: 4.5,
        date: '16 Feb 2024',
        comment:
            'Insightful course with practical examples and clear '
            'explanations. Perfect for developers!',
      ),
      CourseReviewEntity(
        avatar: AppNetworkImages.resultTutorJulia,
        reviewerName: 'Ralph Edwards',
        rating: 4.5,
        date: '16 Feb 2024',
        comment:
            'I wish Muhammad Shahin was my class teacher. His teaching '
            'technic is awesome.',
      ),
    ];
  }

  CourseAuthorEntity getCourseAuthor() {
    return const CourseAuthorEntity(
      avatar: AppNetworkImages.tutorJulia,
      name: 'Julia Anatole',
      institution: 'Harvard Business School',
      rating: 4.5,
      ratingCount: 39,
      bio:
          "I'm Julia, an developer passionate about teaching. As the lead "
          "instructor, I've helped many students and taught at top "
          'companies worldwide.',
      education: [
        EducationEntryEntity(
          icon: Icons.apartment_outlined,
          iconBackground: AppColors.purple100,
          degree: 'Engineering',
          institution: 'University of Oxford',
          years: '2020 - 2024',
        ),
        EducationEntryEntity(
          icon: Icons.apartment_outlined,
          iconBackground: AppColors.blue100,
          degree: 'SSC',
          institution: 'Hobbiton High School',
          years: '2019',
        ),
      ],
    );
  }
}
