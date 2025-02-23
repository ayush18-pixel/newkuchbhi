import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart'; // For API keys

class OTPService {
  static Future<bool> sendOTP(String email, String otp) async {
    final url = Uri.parse("https://api.brevo.com/v3/smtp/email");
    final headers = {
      "api-key": BrevoConstants.apiKey,
      "Content-Type": "application/json"
    };
    final body = jsonEncode({
      "sender": {"name": "IIT Mandi", "email": BrevoConstants.senderEmail},
      "to": [{"email": email}],
      "subject": "Your OTP Code",
      "textContent": "Your OTP is: $otp"
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      return true;
    } else {
      print("Failed to send OTP: ${response.body}");
      return false;
    }
  }
}