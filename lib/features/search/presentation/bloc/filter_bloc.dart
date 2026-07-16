import 'package:flutter_bloc/flutter_bloc.dart';
import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<FilterTargetChanged>(
      (event, emit) => emit(state.copyWith(target: event.target)),
    );
    on<FilterSubjectChanged>(
      (event, emit) => emit(state.copyWith(subject: event.value)),
    );
    on<FilterAvailabilityChanged>(
      (event, emit) => emit(state.copyWith(availabilityDay: event.value)),
    );
    on<FilterTimeslotChanged>(
      (event, emit) => emit(state.copyWith(timeslot: event.value)),
    );
    on<FilterExperienceChanged>(
      (event, emit) => emit(state.copyWith(experience: event.value)),
    );
    on<FilterCertificationChanged>(
      (event, emit) => emit(state.copyWith(certification: event.value)),
    );
    on<FilterCategoryChanged>(
      (event, emit) => emit(state.copyWith(category: event.value)),
    );
    on<FilterDifficultyChanged>(
      (event, emit) => emit(state.copyWith(difficulty: event.value)),
    );
    on<FilterDurationChanged>(
      (event, emit) => emit(state.copyWith(duration: event.value)),
    );
    on<FilterReleasedChanged>(
      (event, emit) => emit(state.copyWith(released: event.value)),
    );
    on<FilterRatingChanged>(
      (event, emit) => emit(state.copyWith(minRatingStars: event.stars)),
    );
    on<FilterPriceRangeChanged>(
      (event, emit) => emit(state.copyWith(priceRange: event.range)),
    );
    on<FilterReset>(
      (event, emit) => emit(FilterState(target: state.target)),
    );
  }
}
