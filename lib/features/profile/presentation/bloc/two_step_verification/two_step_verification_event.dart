import 'package:equatable/equatable.dart';

abstract class TwoStepVerificationEvent extends Equatable {
  const TwoStepVerificationEvent();

  @override
  List<Object?> get props => [];
}

class TwoStepVerificationToggled extends TwoStepVerificationEvent {
  final bool isEnabled;

  const TwoStepVerificationToggled(this.isEnabled);

  @override
  List<Object?> get props => [isEnabled];
}
