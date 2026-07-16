import '../../domain/entities/payment_card_entity.dart';

class PaymentMethodsLocalDataSource {
  List<PaymentCardEntity> getPaymentCards() {
    return const [
      PaymentCardEntity(
        id: 'card-visa',
        type: PaymentCardType.visa,
        label: 'Visa Card',
        subtitle: 'ending ***9879',
      ),
      PaymentCardEntity(
        id: 'card-paypal',
        type: PaymentCardType.paypal,
        label: 'PayPal',
        subtitle: 'muhammad.sh@example.com',
      ),
    ];
  }
}
