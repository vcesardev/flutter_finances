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
        })
        .then((value) => print("Entry Added"))
        .catchError((error) => print("Failed to add Entry: $error"));
  }

  Future<List<Entry>> fetchEntries() async {
    List<Entry> entriesData = [];
    try {
      QuerySnapshot querySnapshot = await entries.get();

      for (var doc in querySnapshot.docs) {
        Entry data = Entry(
          title: doc["title"],
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
}
