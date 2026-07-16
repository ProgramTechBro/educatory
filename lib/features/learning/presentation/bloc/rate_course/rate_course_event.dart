import 'package:equatable/equatable.dart';

abstract class RateCourseEvent extends Equatable {
  const RateCourseEvent();

  @override
  List<Object?> get props => [];
}

class RateCourseRatingChanged extends RateCourseEvent {
  final int rating;

  const RateCourseRatingChanged(this.rating);

  @override
  List<Object?> get props => [rating];
}
