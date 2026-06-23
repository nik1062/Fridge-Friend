class InventoryItem {
  final String id;
  final String name;
  final String category;
  final double quantity;
  final String unit;
  final DateTime expiryDate;
  final DateTime purchaseDate;
  final String location;
  final String status;
  final double price;
  final String imageUrl;

  InventoryItem({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.unit,
    required this.expiryDate,
    required this.purchaseDate,
    required this.location,
    required this.status,
    required this.price,
    required this.imageUrl,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'],
      expiryDate: DateTime.parse(json['expiryDate']),
      purchaseDate: DateTime.parse(json['purchaseDate']),
      location: json['location'],
      status: json['status'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'quantity': quantity,
      'unit': unit,
      'expiryDate': expiryDate.toIso8601String(),
      'purchaseDate': purchaseDate.toIso8601String(),
      'location': location,
      'status': status,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
