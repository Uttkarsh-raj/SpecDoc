import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFuncs {
  Future<Map<String, dynamic>> getDoctorsData(String category) async {
    final collection = FirebaseFirestore.instance.collection('doctors');
    final doctors = await collection.doc(category).get();
    return doctors.data() ?? {};
  }
}
