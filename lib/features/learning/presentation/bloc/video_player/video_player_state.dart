import 'package:equatable/equatable.dart';

class VideoPlayerState extends Equatable {
  final bool isPlaying;

  const VideoPlayerState({this.isPlaying = false});

  VideoPlayerState copyWith({bool? isPlaying}) {
    return VideoPlayerState(isPlaying: isPlaying ?? this.isPlaying);
  }

  @override
  List<Object?> get props => [isPlaying];
}
