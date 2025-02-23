import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> storeOTP(String email, String otp) async {
    await _firestore.collection('otps').doc(email).set({
      'otp': otp,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  static Future<bool> verifyOTP(String email, String userEnteredOTP) async {
    final doc = await _firestore.collection('otps').doc(email).get();
    if (doc.exists) {
      final storedOTP = doc.data()?['otp'];
      return storedOTP == userEnteredOTP;
    }
    return false;
  }
}