import '../../feature/orders/data/models/order_model.dart';
import '../../feature/orders/data/models/order_product_model.dart';
import '../../feature/orders/data/models/shipping_address_model.dart';

OrderModel getDummyOrder() {
  return OrderModel(
    uID: 'ORD123456789',
    totalPrice: 149.97,
    paymentMethod: 'Cash',
    shippingAddress: ShippingAddressModel(
      address: '123 Main Street',
      floor: '2',
      city: 'Cairo',
      phone: '+201234567890',
      name: 'John Doe',
      email: 'john.doe@example.com',
    ),
    orderProducts: [
      OrderProductModel(
        nameEn: 'Wireless Headphones',
        nameAr: 'سماعات لاسلكية',
        imageUrl:
            'https://tse3.mm.bing.net/th?id=OIP.NWnITLblx9ipLhmWID3ovQHaE8&pid=Api&P=0&h=220',
        code: 'WH-001',
        price: 49.99,
        quantity: 1,
      ),
      OrderProductModel(
        nameEn: 'Gaming Mouse',
        nameAr: 'ماوس ألعاب',
        imageUrl:
            'https://tse3.mm.bing.net/th?id=OIP.NWnITLblx9ipLhmWID3ovQHaE8&pid=Api&P=0&h=220',
        code: 'GM-002',
        price: 39.99,
        quantity: 2,
      ),
    ],
  );
}
