class OTP {
  final String otp;
  final String email;
  final DateTime createdAt;

  OTP({
    required this.otp,
    required this.email,
    required this.createdAt,
  });

  // Convert to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}