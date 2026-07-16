enum PaymentCardType { visa, paypal }

class PaymentCardEntity {
  final String id;
  final PaymentCardType type;
  final String label;
  final String subtitle;

  const PaymentCardEntity({
    required this.id,
    required this.type,
    required this.label,
    required this.subtitle,
  });
}
