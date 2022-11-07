class Address {
  final String id;
  final String address;
  final String postalCode;
  final String city;

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
