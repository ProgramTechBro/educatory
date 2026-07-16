import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/payment_card_entity.dart';
import 'payment_methods_event.dart';
import 'payment_methods_state.dart';

class PaymentMethodsBloc
    extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  PaymentMethodsBloc({required List<PaymentCardEntity> initialCards})
      : super(PaymentMethodsState(cards: initialCards)) {
    on<PaymentCardRemoved>(
      (event, emit) => emit(
        state.copyWith(
          cards: state.cards
              .where((card) => card.id != event.cardId)
              .toList(),
        ),
      ),
    );
  }
}
