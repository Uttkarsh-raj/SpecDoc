import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';

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
    if (bookings.exists) {
      List<dynamic> demo = bookings.data()?['bookings'];
      demo.forEach(
        (element) {
          bookingss.add(element.toString());
        },
      );
      return bookingss;
    } else {
      return [];
    }
  }

  Future<void> addBookings(String email, String doctorsEmail) async {
    final collection = FirebaseFirestore.instance.collection('bookings');
    List<String> bookingss = [];
    final bookings = await collection.doc(email).get();
    if (bookings.exists) {
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
    } else {
      bookingss.add(doctorsEmail);
      await collection.doc(email).set({'bookings': bookingss});
    }
  }

  // static Future<User?> signInWithGoogle() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;

  //   if (kIsWeb) {
  //     GoogleAuthProvider authProvider = GoogleAuthProvider();

  //     try {
  //       final UserCredential userCredential =
  //           await auth.signInWithPopup(authProvider);

  //       user = userCredential.user;
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     final GoogleSignIn googleSignIn = GoogleSignIn();

  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();

  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;

  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );

  //       try {
  //         final UserCredential userCredential =
  //             await auth.signInWithCredential(credential);
  //         print(userCredential);

  //         user = userCredential.user;
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'account-exists-with-different-credential') {
  //           // ...
  //         } else if (e.code == 'invalid-credential') {
  //           // ...
  //         }
  //       } catch (e) {
  //         // ...
  //       }
  //     }
  //   }

  //   return user;
  // }

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print(credential);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<void> logOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
