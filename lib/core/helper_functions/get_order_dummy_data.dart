import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_product_entity.dart';

import '../../feature/orders/domain/entieties/order_entity.dart';
import '../../feature/orders/domain/entieties/shipping_address_entity.dart';

OrderEntity getDummyOrder() {
  return OrderEntity(
    uID: 'ORD123456789',
    totalPrice: 149.97,
    paymentMethod: 'Cash',
    shippingAddress: ShippingAddressEntity(
      address: '123 Main Street',
      floor: '2',
      city: 'Cairo',
      phone: '+201234567890',
      name: 'John Doe',
      email: 'john.doe@example.com',
    ),
    orderProducts: [
      OrderProductEntity(
        nameEn: 'Wireless Headphones',
        nameAr: 'سماعات لاسلكية',
        imageUrl:
            'https://tse3.mm.bing.net/th?id=OIP.NWnITLblx9ipLhmWID3ovQHaE8&pid=Api&P=0&h=220',
        code: 'WH-001',
        price: 49.99,
        quantity: 1,
      ),
      OrderProductEntity(
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
