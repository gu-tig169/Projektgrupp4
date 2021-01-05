import 'dart:convert';

import 'package:Projektgrupp4/models/currency.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static final databaseReference = FirebaseDatabase.instance.reference();
  static final String key = 'test-key';

  static void saveFavorites(List<Currency> favorites) {
    for (Currency e in favorites) {
      databaseReference
          .child(key)
          .child(e.symbol)
          .set({'upperThreshold': e.upperThreshold, 'lowerThreshold': e.lowerThreshold});
    }
  }

  static Future<Map<dynamic, dynamic>> getFavorites() async {
    Map<dynamic, dynamic> data;
    try {
      await databaseReference.once().then((DataSnapshot snapshot) {
        data = snapshot.value;
      });
      return data[key];
    } catch (e) {
      return null;
    }
  }

  static void removeFavorites(String symbol) {
    databaseReference.child(key).child(symbol).remove();
  }
}
