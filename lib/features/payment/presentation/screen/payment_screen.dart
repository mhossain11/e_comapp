import 'package:e_comapp/features/payment/presentation/screen/order_confirmed_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  final String orderId;
  final String price;

  PaymentScreen({super.key, required this.orderId, required this.price});

  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    final double subtotal = double.parse(price);
    controller.calculateTotal(subtotal);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- ORDER SUMMARY CARD ---
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _infoRow("Order ID", orderId,wrap: true),
                      _infoRow("Subtotal", "৳${subtotal.toStringAsFixed(2)}"),
                      _infoRow("Shipping", "৳${controller.shipping.value.toStringAsFixed(2)}"),
                      const Divider(thickness: 1),
                      _infoRow(
                        "Total",
                        "৳${controller.total.value.toStringAsFixed(2)}",
                        isBold: true,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// --- PAYMENT METHOD SECTION ---
              const Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              ...controller.paymentMethods.map(
                    (method) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                  child: RadioListTile<String>(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    title: Row(
                      children: [
                        Icon(method["icon"] as IconData, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(method["name"].toString(),
                            style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                    value: method["name"].toString(),
                    groupValue: controller.selectedMethod.value,
                    onChanged: (value) =>
                        controller.selectPaymentMethod(value!),
                  ),
                ),
              ),

              const Spacer(),

              /// --- ERROR MESSAGE ---
              if (controller.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),

              /// --- PAY BUTTON ---
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Colors.blueAccent, Colors.blue],
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: ()async{

                    if(controller.selectedMethod.value.isEmpty){
                      await controller.makePayment();
                      return;
                    }else{
                      Get.snackbar(
                        "Payment Successful 🎉",
                        "Your order has been confirmed.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green.shade600,
                        colorText: Colors.white,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderConfirmedScreen(
                            orderId: orderId,
                            totalPrice: controller.total.value.toString(),
                          ),
                        ),
                      );
                    }



                  },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  )
                      : Text(
                    "Pay ৳${controller.total.value.toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  /// --- Helper Row Widget ---
  Widget _infoRow(String title, String value,
      {bool isBold = false, bool wrap = false}) {
    return Row(
      crossAxisAlignment: wrap ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 15,
              color: Colors.grey[700],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            textAlign: TextAlign.right,
            softWrap: wrap,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
