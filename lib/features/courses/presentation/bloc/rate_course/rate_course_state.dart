import 'package:equatable/equatable.dart';

class RateCourseState extends Equatable {
  final int rating;

  const RateCourseState({this.rating = 0});

  RateCourseState copyWith({int? rating}) {
    return RateCourseState(rating: rating ?? this.rating);
  }

  @override
  List<Object?> get props => [rating];
}
