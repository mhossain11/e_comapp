import 'package:e_comapp/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckoutScreen extends StatefulWidget {
   CheckoutScreen({super.key,required this.cartUid});
    String cartUid;
   static String path ='/checkout';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CheckOutController checkoutController = Get.find<CheckOutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body:  Obx(() {
        if (checkoutController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (checkoutController.checkoutList.isEmpty) {
          return Center(
            child: const Text("Checkout Now"),
          );
        }

        final checkout = checkoutController.checkoutList.last;
        final order = checkout.order;
        final address = order?.deliveryAddress;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                checkout.message.toString(),
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text("🧾 Order ID: ${order?.uid.toString()}"),
              Text("💰 Total Price: ${order?.totalPrice.toString()}"),
              Text("📦 Status: ${order?.status}"),
              Text("💳 Payment: ${order?.paymentStatus}"),
              Text("🗒 Notes: ${order?.notes ?? ''}"),
              Text("🕒 Created: ${order?.createdAt}"),
              const Divider(height: 30),
              const Text("📍 Delivery Address",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text(address!.fullName.toString()),
              Text("${address.addressLine1}, ${address.addressLine2 ?? ''}"),
              Text("${address.city}, ${address.state}, ${address.postalCode}"),
              Text("${address.country}"),
              Text("📞 ${address.phoneNumber}"),
              const Divider(height: 30),
              const Text("🛍 Items",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              ...?order?.items?.map(
                    (item) => Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(item.product.toString()),
                    subtitle: Text(
                        "Size: ${item.productSize}, Color: ${item.productColor}"),
                    trailing: Text("৳${item.price} x ${item.quantity}"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    )
    );
  }
}
