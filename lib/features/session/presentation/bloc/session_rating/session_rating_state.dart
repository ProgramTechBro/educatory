import 'package:equatable/equatable.dart';

class SessionRatingState extends Equatable {
  final int rating;

  const SessionRatingState({this.rating = 0});

  SessionRatingState copyWith({int? rating}) {
    return SessionRatingState(rating: rating ?? this.rating);
  }

  @override
  List<Object?> get props => [rating];
}
