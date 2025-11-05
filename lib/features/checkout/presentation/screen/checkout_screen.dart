import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app/cache/cache_helper.dart';
import '../../../../core/di/injection_container.main.dart';
import '../../domain/model/DeliveryAddress.dart';
import '../controller/checkout_controller.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  static String path = '/checkout';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CheckOutController checkoutController = Get.find<CheckOutController>();
  String? cartUid;

  @override
  void initState() {
    super.initState();
    _initCheckout();
  }

  Future<void> _initCheckout() async {
    cartUid = await sl<CacheHelper>().getData('cartuid');
    if (cartUid != null && cartUid!.isNotEmpty) {
      final address = DeliveryAddress(
        fullName: "John Doe",
        addressLine1: "123 Main St",
        addressLine2: "Apt 4B",
        city: "New York",
        state: "NY",
        postalCode: "10001",
        country: "USA",
        phoneNumber: "+1234567890",
      );

      final checkout = await checkoutController.checkoutData(
        cartUid: cartUid!,
        deliveryAddress: address,
      );
      debugPrint('CartUid:$cartUid');
      print("Delivery Address: $address");

      if (checkout != null) {
        print('✅ Checkout success: ${checkout.order?.uid}');
      } else {
        print('❌ Checkout failed: ${checkoutController.errorMessage.value}');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (checkoutController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (checkoutController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              checkoutController.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (checkoutController.checkoutList.isEmpty) {
          return const Center(
            child: Text("No checkout data available."),
          );
        }

        final checkout = checkoutController.checkoutList.last;
        final order = checkout.order;
        final address = order?.deliveryAddress;

        if (order == null || address == null) {
          return const Center(
            child: Text("Order or address not found."),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("🧾 Order Summary",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text("Order ID: ${order.uid}"),
                      Text("Status: ${order.status}"),
                      Text("Payment: ${order.paymentStatus}"),
                      Text("Total Price: ৳${order.totalPrice}"),
                      Text("Created: ${order.createdAt}"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("📍 Delivery Address",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(address.fullName ?? ''),
                      Text(
                          "${address.addressLine1}, ${address.addressLine2 ?? ''}"),
                      Text(
                          "${address.city}, ${address.state}, ${address.postalCode}"),
                      Text(address.country ?? ''),
                      Text("📞 ${address.phoneNumber}"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "🛍 Items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...?order.items?.map(
                    (item) => Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade50,
                      child: const Icon(Icons.shopping_bag,
                          color: Colors.blueAccent),
                    ),
                    title: Text(item.product.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                        "Size: ${item.productSize}, Color: ${item.productColor}"),
                    trailing:
                    Text("৳${item.price} x ${item.quantity.toString()}"),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text("Confirm Order"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Order confirmed ✅")),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
