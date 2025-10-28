/// product : "Exclusive Men's Panjabi"
/// product_size : "M"
/// product_color : "Black"
/// quantity : 4
/// price : "2520.00"

class Items {
  Items({
      String? product, 
      String? productSize, 
      String? productColor, 
      num? quantity, 
      String? price,}){
    _product = product;
    _productSize = productSize;
    _productColor = productColor;
    _quantity = quantity;
    _price = price;
}

  Items.fromJson(dynamic json) {
    _product = json['product'];
    _productSize = json['product_size'];
    _productColor = json['product_color'];
    _quantity = json['quantity'];
    _price = json['price'];
  }
  String? _product;
  String? _productSize;
  String? _productColor;
  num? _quantity;
  String? _price;
Items copyWith({  String? product,
  String? productSize,
  String? productColor,
  num? quantity,
  String? price,
}) => Items(  product: product ?? _product,
  productSize: productSize ?? _productSize,
  productColor: productColor ?? _productColor,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
);
  String? get product => _product;
  String? get productSize => _productSize;
  String? get productColor => _productColor;
  num? get quantity => _quantity;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product'] = _product;
    map['product_size'] = _productSize;
    map['product_color'] = _productColor;
    map['quantity'] = _quantity;
    map['price'] = _price;
    return map;
  }

}