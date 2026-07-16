import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/search_target.dart';

class FilterState extends Equatable {
  final SearchTarget target;

  final String subject;
  final String availabilityDay;
  final String timeslot;
  final String experience;
  final String certification;

  final String category;
  final String difficulty;
  final String duration;
  final String released;

  final int minRatingStars;
  final RangeValues priceRange;

  const FilterState({
    this.target = SearchTarget.tutors,
    this.subject = 'MAT 116',
    this.availabilityDay = 'Monday',
    this.timeslot = 'Afternoon',
    this.experience = '1-3 Years',
    this.certification = "Master's in Applied Mathematics",
    this.category = 'Programming',
    this.difficulty = 'Beginner',
    this.duration = '3-6 hrs',
    this.released = 'In last 6 Month',
    this.minRatingStars = 3,
    this.priceRange = const RangeValues(12, 29),
  });

  int get activeFilterCount => 5;

  FilterState copyWith({
    SearchTarget? target,
    String? subject,
    String? availabilityDay,
    String? timeslot,
    String? experience,
    String? certification,
    String? category,
    String? difficulty,
    String? duration,
    String? released,
    int? minRatingStars,
    RangeValues? priceRange,
  }) {
    return FilterState(
      target: target ?? this.target,
      subject: subject ?? this.subject,
      availabilityDay: availabilityDay ?? this.availabilityDay,
      timeslot: timeslot ?? this.timeslot,
      experience: experience ?? this.experience,
      certification: certification ?? this.certification,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      duration: duration ?? this.duration,
      released: released ?? this.released,
      minRatingStars: minRatingStars ?? this.minRatingStars,
      priceRange: priceRange ?? this.priceRange,
    );
  }

  @override
  List<Object?> get props => [
        target,
        subject,
        availabilityDay,
        timeslot,
        experience,
        certification,
        category,
        difficulty,
        duration,
        released,
        minRatingStars,
        priceRange,
      ];
}
