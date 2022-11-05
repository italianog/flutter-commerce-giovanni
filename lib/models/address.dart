class Address {
  String id;
  String address;
  String postalCode;
  String city;

  Address({
    required this.id,
    required this.address,
    required this.postalCode,
    required this.city,
  });

  factory Address.fromMap(Map<String, dynamic> map, String id) {
    return Address(
      id: id,
      address: map['address'],
      postalCode: map['postalCode'],
      city: map['city'],
    );
  }
}
