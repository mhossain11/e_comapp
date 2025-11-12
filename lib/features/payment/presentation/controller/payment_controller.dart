import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var shipping = 60.0.obs;
  var total = 0.0.obs;
  var selectedMethod = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final paymentMethods = [
    {"name": "Bkash", "icon": Icons.mobile_friendly},
    {"name": "Nagad", "icon": Icons.account_balance_wallet},
    {"name": "Rocket", "icon": Icons.payment},
    {"name": "Cash on Delivery", "icon": Icons.delivery_dining},
  ];

  /// 🧮 Calculate Total (Subtotal + Shipping)
  void calculateTotal(double price) {
    total.value = price + shipping.value;
  }

  /// 💳 Select payment method
  void selectPaymentMethod(String method) {
    selectedMethod.value = method;
    errorMessage.value = '';
  }

  /// 🚀 Simulate payment process
  Future<void> makePayment() async {
    if (selectedMethod.value.isEmpty) {
      errorMessage.value = "⚠️ Please select a payment method.";
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));

    bool hasStockIssue = false; // you can modify this dynamically
    if (hasStockIssue) {
      errorMessage.value = '⚠️ Insufficient stock for the following items.';
      isLoading.value = false;
      return;
    }

  }
}
