import 'package:equatable/equatable.dart';
import '../../domain/entities/payment_method.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object?> get props => [];
}

class PaymentMethodChanged extends PaymentEvent {
  final PaymentMethod method;
  const PaymentMethodChanged(this.method);

  @override
  List<Object?> get props => [method];
}
