import 'package:equatable/equatable.dart';
import '../../domain/entities/course_detail_tab.dart';

abstract class CourseDetailEvent extends Equatable {
  const CourseDetailEvent();

  @override
  List<Object?> get props => [];
}

class CourseDetailTabChanged extends CourseDetailEvent {
  final CourseDetailTab tab;
  const CourseDetailTabChanged(this.tab);

  @override
  List<Object?> get props => [tab];
}
