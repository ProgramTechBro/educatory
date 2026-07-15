import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/search_target.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class FilterTargetChanged extends FilterEvent {
  final SearchTarget target;
  const FilterTargetChanged(this.target);

  @override
  List<Object?> get props => [target];
}

class FilterSubjectChanged extends FilterEvent {
  final String value;
  const FilterSubjectChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FilterAvailabilityChanged extends FilterEvent {
  final String value;
  const FilterAvailabilityChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FilterTimeslotChanged extends FilterEvent {
  final String value;
  const FilterTimeslotChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FilterExperienceChanged extends FilterEvent {
  final String value;
  const FilterExperienceChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FilterCertificationChanged extends FilterEvent {
  final String value;
  const FilterCertificationChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FilterCategoryChanged extends FilterEvent {
  final String value;
  const FilterCategoryChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FilterDifficultyChanged extends FilterEvent {
  final String value;
  const FilterDifficultyChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FilterDurationChanged extends FilterEvent {
  final String value;
  const FilterDurationChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FilterReleasedChanged extends FilterEvent {
  final String value;
  const FilterReleasedChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FilterRatingChanged extends FilterEvent {
  final int stars;
  const FilterRatingChanged(this.stars);

  @override
  List<Object?> get props => [stars];
}

class FilterPriceRangeChanged extends FilterEvent {
  final RangeValues range;
  const FilterPriceRangeChanged(this.range);

  @override
  List<Object?> get props => [range];
}

class FilterReset extends FilterEvent {
  const FilterReset();
}
