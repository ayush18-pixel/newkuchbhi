import 'package:flutter_dotenv/flutter_dotenv.dart';

class BrevoConstants {
  static String apiKey = dotenv.env['API_KEY'] ?? '';
  static const String senderEmail = "ayushraj222006@gmail.com";
}