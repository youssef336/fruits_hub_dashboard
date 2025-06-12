class ShippingAddressModel {
  String? address;
  String? floor;
  String? city;
  String? phone;
  String? name;
  String? email;

  ShippingAddressModel({
    this.address,
    this.floor,
    this.city,
    this.phone,
    this.name,
    this.email,
  });
  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      ShippingAddressModel(
        address: json['address'],
        floor: json['floor'],
        city: json['city'],
        phone: json['phone'],
        name: json['name'],
        email: json['email'],
      );
  toJson() {
    return {
      'address': address,
      'floor': floor,
      'city': city,
      'phone': phone,
      'name': name,
      'email': email,
    };
  }

  @override
  String toString() {
    return '$address $floor $city';
  }
}
