import 'package:equatable/equatable.dart';
import '../../domain/entities/payment_method.dart';

class PaymentState extends Equatable {
  final PaymentMethod method;

  const PaymentState({this.method = PaymentMethod.creditCard});

  PaymentState copyWith({PaymentMethod? method}) {
    return PaymentState(method: method ?? this.method);
  }

  @override
  List<Object?> get props => [method];
}
