import 'package:equatable/equatable.dart';
import '../../../domain/entities/payment_card_entity.dart';

class PaymentMethodsState extends Equatable {
  final List<PaymentCardEntity> cards;

  const PaymentMethodsState({this.cards = const []});

  PaymentMethodsState copyWith({List<PaymentCardEntity>? cards}) {
    return PaymentMethodsState(cards: cards ?? this.cards);
  }

  @override
  List<Object?> get props => [cards];
}
