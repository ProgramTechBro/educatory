import '../../domain/entities/order_summary_entity.dart';

class CartLocalDataSource {
  OrderSummaryEntity getOrderSummary() {
    return const OrderSummaryEntity(
      courseName: 'Advanced Front-End Programming Techniques',
      subtotal: 30,
      discount: 3,
      vatPercent: 9,
      vatAmount: 2.43,
      tutorName: 'Robert Fox',
    );
  }
}
