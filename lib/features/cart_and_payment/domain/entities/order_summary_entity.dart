class OrderSummaryEntity {
  final String courseName;
  final double subtotal;
  final double discount;
  final double vatPercent;
  final double vatAmount;
  final String tutorName;

  const OrderSummaryEntity({
    required this.courseName,
    required this.subtotal,
    required this.discount,
    required this.vatPercent,
    required this.vatAmount,
    required this.tutorName,
  });

  double get total => subtotal - discount + vatAmount;
}
