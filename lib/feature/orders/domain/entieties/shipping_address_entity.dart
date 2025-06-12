class ShippingAddressEntity {
  String? address;
  String? floor;
  String? city;
  String? phone;
  String? name;
  String? email;

  ShippingAddressEntity({
    this.address,
    this.floor,
    this.city,
    this.phone,
    this.name,
    this.email,
  });
  @override
  String toString() {
    return '$address $floor $city';
  }
}
