/*
import 'package:e_comapp/features/payment/presentation/screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
              //Delivery Address
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

              //Items
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
              //Order Summary
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
                      Text("Created: ${formatTime(order.createdAt)}"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              //button
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                   */
/* ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Order confirmed ✅")),
                    );*//*

                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String formatTime(String? createdAt) {
    if (createdAt == null || createdAt.isEmpty) return '';
    try {
      final date = DateTime.parse(createdAt);
      return DateFormat('hh:mm a').format(date); // Example: 02:32 PM
    } catch (_) {
      return createdAt; // fallback
    }
  }
}
*/

import 'package:e_comapp/features/payment/presentation/screen/payment_screen.dart';
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
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('🧾 Checkout'),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Obx(() {
        if (checkoutController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (checkoutController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              checkoutController.errorMessage.value,
              style: const TextStyle(color: Colors.red, fontSize: 16),
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
            children: [
              //Delivery Address
              const SizedBox(height: 16),
              _buildSectionCard(
                title: "Delivery Address",
                icon: Icons.location_on_outlined,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.fullName ?? '',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.phone, size: 18, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(address.phoneNumber ?? ''),
                      ],
                    ),
                    Text("addressLine1: ${address.addressLine1}, ${address.addressLine2 ?? ''}"),
                    Text("${address.city}, ${address.state}, ${address.postalCode}"),
                    Text(address.country ?? ''),
                    const SizedBox(height: 4),

                  ],
                ),
              ),

              //items
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "🛍 Items",
                  style: theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              ...?order.items?.map(
                    (item) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(1, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.blue.shade50,
                      child: const Icon(Icons.shopping_bag,
                          color: Colors.blueAccent),
                    ),
                    title: Text(
                      item.product.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Size: ${item.productSize}, Color: ${item.productColor}",
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    trailing: Text(
                      "৳${item.price} x ${item.quantity}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),

              //Order Summary
              const SizedBox(height: 16),
              _buildSectionCard(
                title: "Order Summary",
                icon: Icons.receipt_long,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow("Order ID", order.uid!),
                    _infoRow("Status", order.status!),
                    _infoRow("Payment", order.paymentStatus!),
                    _infoRow("Total Price", "৳${order.totalPrice}"),
                    _infoRow("Created", order.createdAt ?? ""),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(1, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Total", style: TextStyle(fontSize: 16)),
                        Text(
                          "৳${order.totalPrice}",
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                orderId:order.uid!,
                                price: order.totalPrice!,)),
                        );
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text("Confirm Order"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 6, offset: const Offset(1, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blueAccent),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 16, color: Colors.grey),
          content,
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(label,
                  style: const TextStyle(color: Colors.grey, fontSize: 14))),
          Expanded(
              flex: 5,
              child: Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15))),
        ],
      ),
    );
  }
}

