import 'DeliveryAddress.dart';
import 'Items.dart';

/// uid : "6cf56e0c-e0e9-440c-aaeb-73e3a2053a04"
/// user : null
/// delivery_address : {"uid":"ac72e7f8-086c-4ec2-bb52-1e118ca1d5df","full_name":"John Doe","address_line1":"123 Main St","address_line2":"Apt 4B","city":"New York","state":"NY","postal_code":"10001","country":"USA","phone_number":"+1234567890","is_default":false}
/// total_price : "11155.50"
/// status : "pending"
/// payment_status : "pending"
/// notes : "Leave at front door"
/// items : [{"product":"Exclusive Men's Panjabi","product_size":"M","product_color":"Black","quantity":4,"price":"2520.00"},{"product":"White Jacquard Cotton Printed Fatua","product_size":"M","product_color":"White","quantity":1,"price":"1075.50"}]
/// created_at : "2025-10-07T03:42:41.485962Z"

class Order {
  Order({
      String? uid, 
      dynamic user, 
      DeliveryAddress? deliveryAddress, 
      String? totalPrice, 
      String? status, 
      String? paymentStatus, 
      String? notes, 
      List<Items>? items, 
      String? createdAt,}){
    _uid = uid;
    _user = user;
    _deliveryAddress = deliveryAddress;
    _totalPrice = totalPrice;
    _status = status;
    _paymentStatus = paymentStatus;
    _notes = notes;
    _items = items;
    _createdAt = createdAt;
}

  Order.fromJson(dynamic json) {
    _uid = json['uid'];
    _user = json['user'];
    _deliveryAddress = json['delivery_address'] != null ? DeliveryAddress.fromJson(json['delivery_address']) : null;
    _totalPrice = json['total_price'];
    _status = json['status'];
    _paymentStatus = json['payment_status'];
    _notes = json['notes'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _createdAt = json['created_at'];
  }
  String? _uid;
  dynamic _user;
  DeliveryAddress? _deliveryAddress;
  String? _totalPrice;
  String? _status;
  String? _paymentStatus;
  String? _notes;
  List<Items>? _items;
  String? _createdAt;
Order copyWith({  String? uid,
  dynamic user,
  DeliveryAddress? deliveryAddress,
  String? totalPrice,
  String? status,
  String? paymentStatus,
  String? notes,
  List<Items>? items,
  String? createdAt,
}) => Order(  uid: uid ?? _uid,
  user: user ?? _user,
  deliveryAddress: deliveryAddress ?? _deliveryAddress,
  totalPrice: totalPrice ?? _totalPrice,
  status: status ?? _status,
  paymentStatus: paymentStatus ?? _paymentStatus,
  notes: notes ?? _notes,
  items: items ?? _items,
  createdAt: createdAt ?? _createdAt,
);
  String? get uid => _uid;
  dynamic get user => _user;
  DeliveryAddress? get deliveryAddress => _deliveryAddress;
  String? get totalPrice => _totalPrice;
  String? get status => _status;
  String? get paymentStatus => _paymentStatus;
  String? get notes => _notes;
  List<Items>? get items => _items;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['user'] = _user;
    if (_deliveryAddress != null) {
      map['delivery_address'] = _deliveryAddress?.toJson();
    }
    map['total_price'] = _totalPrice;
    map['status'] = _status;
    map['payment_status'] = _paymentStatus;
    map['notes'] = _notes;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    return map;
  }

}