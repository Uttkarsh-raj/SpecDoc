import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFuncs {
  Future<Map<String, dynamic>> getDoctorsData(String category) async {
    final collection = FirebaseFirestore.instance.collection('doctors');
    final doctors = await collection.doc(category).get();
    return doctors.data() ?? {};
  }

  Future<List<String>> getBookingsData(String email) async {
    final collection = FirebaseFirestore.instance.collection('bookings');
    final bookings = await collection.doc(email).get();
    List<String> bookingss = [];
    List<dynamic> demo = bookings.data()?['bookings'];
    demo.forEach(
      (element) {
        bookingss.add(element.toString());
      },
    );
    return bookingss;
  }

  Future<void> addBookings(String email, String doctorsEmail) async {
    final collection = FirebaseFirestore.instance.collection('bookings');
    final bookings = await collection.doc(email).get();
    List<String> bookingss = [];
    List<dynamic> demo = bookings.data()?['bookings'];
    demo.forEach(
      (element) {
        bookingss.add(element.toString());
      },
    );
    if (!bookingss.contains(doctorsEmail)) {
      bookingss.add(doctorsEmail);
    }
    await collection.doc(email).update({'bookings': bookingss});
  }
}
