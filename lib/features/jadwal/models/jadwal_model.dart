class Posyandu {
  final int id;
  final String name;
  final String address;
  final String postalCode;

  Posyandu({
    required this.id,
    required this.name,
    required this.address,
    required this.postalCode,
  });

  // Factory constructor to create an instance of Posyandu from a JSON object
  factory Posyandu.fromJson(Map<String, dynamic> json) {
    return Posyandu(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      postalCode: json['postal_code'],
    );
  }
}
