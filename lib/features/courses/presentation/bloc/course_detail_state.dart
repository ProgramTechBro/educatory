import 'package:equatable/equatable.dart';
import '../../domain/entities/course_detail_tab.dart';

class CourseDetailState extends Equatable {
  final CourseDetailTab activeTab;

  const CourseDetailState({this.activeTab = CourseDetailTab.about});

  CourseDetailState copyWith({CourseDetailTab? activeTab}) {
    return CourseDetailState(activeTab: activeTab ?? this.activeTab);
  }

  @override
  List<Object?> get props => [activeTab];
}
