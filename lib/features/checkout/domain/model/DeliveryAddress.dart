/// uid : "ac72e7f8-086c-4ec2-bb52-1e118ca1d5df"
/// full_name : "John Doe"
/// address_line1 : "123 Main St"
/// address_line2 : "Apt 4B"
/// city : "New York"
/// state : "NY"
/// postal_code : "10001"
/// country : "USA"
/// phone_number : "+1234567890"
/// is_default : false

class DeliveryAddress {
   DeliveryAddress({
      String? uid, 
      String? fullName, 
      String? addressLine1, 
      String? addressLine2, 
      String? city, 
      String? state, 
      String? postalCode, 
      String? country, 
      String? phoneNumber, 
      bool? isDefault = false ,}){
    _uid = uid;
    _fullName = fullName;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _city = city;
    _state = state;
    _postalCode = postalCode;
    _country = country;
    _phoneNumber = phoneNumber;
    _isDefault = isDefault;
}

  DeliveryAddress.fromJson(dynamic json) {
    _uid = json['uid'];
    _fullName = json['full_name'];
    _addressLine1 = json['address_line1'];
    _addressLine2 = json['address_line2'];
    _city = json['city'];
    _state = json['state'];
    _postalCode = json['postal_code'];
    _country = json['country'];
    _phoneNumber = json['phone_number'];
    _isDefault = json['is_default'];
  }
  String? _uid;
  String? _fullName;
  String? _addressLine1;
  String? _addressLine2;
  String? _city;
  String? _state;
  String? _postalCode;
  String? _country;
  String? _phoneNumber;
  bool? _isDefault;
DeliveryAddress copyWith({
  String? uid,
  String? fullName,
  String? addressLine1,
  String? addressLine2,
  String? city,
  String? state,
  String? postalCode,
  String? country,
  String? phoneNumber,
  bool? isDefault,
}) => DeliveryAddress(
  uid: uid ?? _uid,
  fullName: fullName ?? _fullName,
  addressLine1: addressLine1 ?? _addressLine1,
  addressLine2: addressLine2 ?? _addressLine2,
  city: city ?? _city,
  state: state ?? _state,
  postalCode: postalCode ?? _postalCode,
  country: country ?? _country,
  phoneNumber: phoneNumber ?? _phoneNumber,
  isDefault: isDefault ?? _isDefault,
);
  String? get uid => _uid;
  String? get fullName => _fullName;
  String? get addressLine1 => _addressLine1;
  String? get addressLine2 => _addressLine2;
  String? get city => _city;
  String? get state => _state;
  String? get postalCode => _postalCode;
  String? get country => _country;
  String? get phoneNumber => _phoneNumber;
  bool? get isDefault => _isDefault;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['full_name'] = _fullName;
    map['address_line1'] = _addressLine1;
    map['address_line2'] = _addressLine2;
    map['city'] = _city;
    map['state'] = _state;
    map['postal_code'] = _postalCode;
    map['country'] = _country;
    map['phone_number'] = _phoneNumber;
    map['is_default'] = _isDefault;
    return map;
  }

}