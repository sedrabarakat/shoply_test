import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static final String baseUrl = dotenv.env['DOMAIN'].toString();
  static final String secretKey = dotenv.env['API_KEY'].toString();

  static final String getShops = "$baseUrl/shop/test/find/all/shop";
}
