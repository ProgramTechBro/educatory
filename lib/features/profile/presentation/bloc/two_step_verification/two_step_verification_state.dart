import 'package:equatable/equatable.dart';

class TwoStepVerificationState extends Equatable {
  final bool isEnabled;

  const TwoStepVerificationState({this.isEnabled = true});

  TwoStepVerificationState copyWith({bool? isEnabled}) {
    return TwoStepVerificationState(isEnabled: isEnabled ?? this.isEnabled);
  }

  @override
  List<Object?> get props => [isEnabled];
}
