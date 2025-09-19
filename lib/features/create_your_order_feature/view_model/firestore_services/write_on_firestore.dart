import 'package:cloud_firestore/cloud_firestore.dart';

import 'model.dart';

class WriteOnFirestore {
  static Future<void> saveOrderToFirestore({
    required String uid,
    required List<OrderItem> veg,
    required List<OrderItem> meat,
    required List<OrderItem> carbs,
    required int totalCals,
    required double totalPrice,
  }) async {
    final db = FirebaseFirestore.instance;
    final orderRef = db.collection('users').doc(uid).collection('orders').doc();

    // 1) create the parent order document
    await orderRef.set({
      'createdAt': FieldValue.serverTimestamp(),
      'totalCals': totalCals,
      'totalPrice': totalPrice,
    });

    // 2) batch‑write all category items
    final batch = db.batch();

    void addSub(List<OrderItem> items, String sub) {
      for (final item in items) {
        final doc = orderRef.collection(sub).doc(item.id);
        batch.set(doc, item.toJson());
      }
    }

    addSub(veg, 'vegetables');
    addSub(meat, 'meats');
    addSub(carbs, 'carbs');

    await batch.commit();
  }
}
