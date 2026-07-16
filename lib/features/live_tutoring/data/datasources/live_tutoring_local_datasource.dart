import 'package:flutter/material.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../domain/entities/subject_detail_entity.dart';
import '../../domain/entities/tutor_detail_entity.dart';
import '../../domain/entities/tutor_entity.dart';

class LiveTutoringLocalDataSource {
  SubjectDetailEntity getSubjectDetail() {
    return const SubjectDetailEntity(
      image: AppImages.liveSubjectArchitecture,
      code: 'Arch 116',
      title: 'ARCH116 - Introduction to Architecture',
      description:
          'ARCH116 bridges foundational mathematics with architectural '
          'design, covering algebra, functions, and basic geometry for '
          'aspiring architects.',
    );
  }

  List<TutorEntity> getSubjectTutors() {
    return const [
      TutorEntity(
        id: 'tutor-robert-fox',
        avatar: AppNetworkImages.tutorRobertFox,
        name: 'Robert Fox',
        institution: 'University of Oxford',
        rating: 4.5,
        ratingCount: 39,
        hourlyRate: 30,
        originalHourlyRate: 49,
        isOnline: true,
      ),
      TutorEntity(
        id: 'tutor-esther-howard',
        avatar: AppNetworkImages.tutorEstherHoward,
        name: 'Esther Howard',
        institution: 'University of Yorkshire',
        rating: 4.5,
        ratingCount: 39,
        hourlyRate: 28,
        originalHourlyRate: 40,
      ),
      TutorEntity(
        id: 'tutor-guy-hawkins-london',
        avatar: AppNetworkImages.tutorGuyHawkinsLondon,
        name: 'Guy Hawkins',
        institution: 'University of London',
        rating: 4.5,
        ratingCount: 39,
        hourlyRate: 24,
        originalHourlyRate: 32,
      ),
      TutorEntity(
        id: 'tutor-darrel-steward',
        avatar: AppNetworkImages.tutorDarrelSteward,
        name: 'Darrel Steward',
        institution: 'Københavns Universitet',
        rating: 4.5,
        ratingCount: 39,
        hourlyRate: 21,
        originalHourlyRate: 28,
      ),
      TutorEntity(
        id: 'tutor-guy-hawkins-aarhus',
        avatar: AppNetworkImages.tutorGuyHawkinsAarhus,
        name: 'Guy Hawkins',
        institution: 'Aarhus Universitet',
        rating: 4.2,
        ratingCount: 21,
        hourlyRate: 30,
        originalHourlyRate: 36,
      ),
    ];
  }

  TutorDetailEntity getTutorDetail() {
    final tutor = getSubjectTutors().first;

    return TutorDetailEntity(
      tutor: tutor,
      bio:
          "I'm Robert Fox, an architect passionate about teaching. As the "
          "lead instructor, I've helped many students and taught at top "
          'companies worldwide.',
      education: const [
        TutorEducationEntity(
          icon: Icons.account_balance,
          iconBackground: AppColors.purple50,
          degree: 'Engineering',
          institution: 'University of Oxford',
          years: '2020 - 2024',
        ),
        TutorEducationEntity(
          icon: Icons.account_balance,
          iconBackground: AppColors.blue100,
          degree: 'SSC',
          institution: 'Hobbiton High School',
          years: '2019',
        ),
      ],
      reviews: const [
        TutorReviewEntity(
          avatar: null,
          reviewerName: 'Naomi Klein',
          rating: 4.5,
          date: '16 Feb 2024',
          comment:
              'I wish Robert Fox was my class teacher. His teaching '
              'technic is awesome.',
        ),
        TutorReviewEntity(
          avatar: AppNetworkImages.reviewerMuhammadShahin,
          reviewerName: 'Muhammad Shahin',
          rating: 4.5,
          date: '16 Feb 2024',
          comment:
              "Robert Fox's teaching is outstanding. He makes learning "
              'complex topics simple and enjoyable.',
        ),
      ],
    );
  }
}
