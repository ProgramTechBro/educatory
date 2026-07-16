import 'package:equatable/equatable.dart';

abstract class SessionRatingEvent extends Equatable {
  const SessionRatingEvent();

  @override
  List<Object?> get props => [];
}

class SessionRatingChanged extends SessionRatingEvent {
  final int rating;

  const SessionRatingChanged(this.rating);

  @override
  List<Object?> get props => [rating];
}
