import 'package:equatable/equatable.dart';

abstract class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent();

  @override
  List<Object?> get props => [];
}

class VideoPlayPauseToggled extends VideoPlayerEvent {
  const VideoPlayPauseToggled();
}
