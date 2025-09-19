class OrderItem {
  final String id; // itemId or productId
  final String name;
  final int quantity;
  final double pricePerUnit;
  final int calPerUnit;

  OrderItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.pricePerUnit,
    required this.calPerUnit,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'pricePerUnit': pricePerUnit,
    'calPerUnit': calPerUnit,
  };
}
