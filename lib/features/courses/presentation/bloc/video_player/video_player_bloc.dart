import 'package:flutter_bloc/flutter_bloc.dart';
import 'video_player_event.dart';
import 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(const VideoPlayerState()) {
    on<VideoPlayPauseToggled>(
      (event, emit) => emit(state.copyWith(isPlaying: !state.isPlaying)),
    );
  }
}
