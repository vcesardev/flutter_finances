import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_finances/models/entry.dart';
import 'package:flutter_finances/models/entry_payload.dart';

class EntriesService {
  CollectionReference entries =
      FirebaseFirestore.instance.collection('entries');

  Future<void> addEntry(EntryPayload data) {
    return entries
        .add({
          "date": data.date,
          "price": data.price,
          "title": data.title,
          "transactionCategory": data.transactionCategory,
          "transactionType": data.transactionType,
          "userId": data.userId,
        })
        .then((value) => print("Entry Added"))
        .catchError((error) => print("Failed to add Entry: $error"));
  }

  Future<List<Entry>> fetchEntries(DateTime datetime, String userId) async {
    List<Entry> entriesData = [];
    try {
      DateTime startDate = DateTime(
          datetime.year, datetime.month, 1); // Primeiro dia do mês atual
      DateTime endDate = DateTime(datetime.year, datetime.month + 1, 1)
          .subtract(Duration(seconds: 1)); // Último dia do mês atual

      // Consulta com filtro de data
      QuerySnapshot querySnapshot = await entries
          .where("date", isGreaterThanOrEqualTo: startDate)
          .where("date", isLessThanOrEqualTo: endDate)
          .where("userId", isEqualTo: userId)
          .get();

      for (var doc in querySnapshot.docs) {
        Entry data = Entry(
          title: doc["title"],
          userId: doc["userId"],
          price: doc["price"],
          transactionCategory: doc["transactionCategory"],
          date: (doc["date"] as Timestamp).toDate(),
          transactionType: doc["transactionType"],
          id: doc.id,
        );
        entriesData.add(data);
      }

      if (entriesData.isNotEmpty) {
        entriesData.sort((a, b) => b.date.compareTo(a.date));
        return entriesData;
      }

      return [];
    } catch (error) {
      throw Exception("Failed to fetch entries: $error");
    }
  }

  Future<void> deleteEntry(String entryId) async {
    try {
      await entries.doc(entryId).delete();
      print("Entry delete successfully");
    } catch (e) {
      throw Exception("Failed to delete entry: $e");
    }
  }
}
