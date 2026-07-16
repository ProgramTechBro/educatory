import 'package:equatable/equatable.dart';

abstract class PaymentMethodsEvent extends Equatable {
  const PaymentMethodsEvent();

  @override
  List<Object?> get props => [];
}

class PaymentCardRemoved extends PaymentMethodsEvent {
  final String cardId;

  const PaymentCardRemoved(this.cardId);

  @override
  List<Object?> get props => [cardId];
}
