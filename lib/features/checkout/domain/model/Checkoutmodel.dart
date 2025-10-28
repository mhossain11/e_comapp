import 'Order.dart';

/// message : "Checkout successful"
/// order : {"uid":"6cf56e0c-e0e9-440c-aaeb-73e3a2053a04","user":null,"delivery_address":{"uid":"ac72e7f8-086c-4ec2-bb52-1e118ca1d5df","full_name":"John Doe","address_line1":"123 Main St","address_line2":"Apt 4B","city":"New York","state":"NY","postal_code":"10001","country":"USA","phone_number":"+1234567890","is_default":false},"total_price":"11155.50","status":"pending","payment_status":"pending","notes":"Leave at front door","items":[{"product":"Exclusive Men's Panjabi","product_size":"M","product_color":"Black","quantity":4,"price":"2520.00"},{"product":"White Jacquard Cotton Printed Fatua","product_size":"M","product_color":"White","quantity":1,"price":"1075.50"}],"created_at":"2025-10-07T03:42:41.485962Z"}

class CheckoutModel {
  CheckoutModel({
      String? message, 
      Order? order,}){
    _message = message;
    _order = order;
}

  CheckoutModel.fromJson(dynamic json) {
    _message = json['message'];
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
  String? _message;
  Order? _order;
CheckoutModel copyWith({  String? message,
  Order? order,
}) => CheckoutModel(  message: message ?? _message,
  order: order ?? _order,
);
  String? get message => _message;
  Order? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    return map;
  }

}