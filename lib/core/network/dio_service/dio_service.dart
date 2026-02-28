import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../api_urls/api_config.dart';


class DioService {

  static final DioService _instance = DioService._internal();
  factory DioService() => _instance;

  late final Dio _dio;
  static String? _token;

  DioService._internal() {
    _init();
  }

  void _init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        responseType: ResponseType.json,
        headers: _defaultHeaders(),
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Map<String, dynamic> _defaultHeaders() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'secretKey': ApiConfig.secretKey
     // if (_token != null) 'Authorization': 'Bearer $_token',
    };
  }

  Dio get dio => _dio;

  // ---------------- Token Management ----------------

  static Future<void> setToken(String token) async {
    _token = token;
    _updateAuthHeader();
  }

  static Future<void> removeToken() async {
    _token = null;
    _updateAuthHeader();
  }

  static bool get isLoggedIn => _token != null;

  static void _updateAuthHeader() {
    _instance._dio.options.headers['Authorization'] =
    _token != null ? 'Bearer $_token' : null;
  }

  // ---------------- Language ----------------

  void setLanguage(String lang) {
    _dio.options.headers['Accept-Language'] = lang;
  }
}