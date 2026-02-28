import 'package:dio/dio.dart';
import '../../data/models/api_request.dart';
import '../../data/models/api_response.dart';
import '../exceptions_service/network_exceptions.dart';
import 'api_service.dart';

class ApiServicesImp implements ApiServices {
  final Dio _dio;

  final Map<String, dynamic> Function()? headersBuilder;

  ApiServicesImp(this._dio, {this.headersBuilder});

  Map<String, dynamic> _buildHeaders(ApiRequest request) {
    final base = Map<String, dynamic>.from(headersBuilder?.call() ?? {});

    if (request.headers != null) {
      base.addAll(request.headers!);
    }

    return base;
  }

  @override
  Future<ApiResponse<T>> get<T>(
    ApiRequest request,
    T Function(Object?) fromJsonT,
  ) => _request<T>(request, method: 'GET', fromJsonT: fromJsonT);

  @override
  Future<ApiResponse<T>> post<T>(
    ApiRequest request,
    T Function(Object?) fromJsonT, {
    int successStatusCode = 200,
  }) => _request<T>(
    request,
    method: 'POST',
    fromJsonT: fromJsonT,
    successStatusCode: successStatusCode,
  );

  @override
  Future<ApiResponse<T>> put<T>(
    ApiRequest request,
    T Function(Object?) fromJsonT, {
    int successStatusCode = 200,
  }) => _request<T>(
    request,
    method: 'PUT',
    fromJsonT: fromJsonT,
    successStatusCode: successStatusCode,
  );

  @override
  Future<ApiResponse<T>> delete<T>(
    ApiRequest request,
    T Function(Object?) fromJsonT,
  ) => _request<T>(request, method: 'DELETE', fromJsonT: fromJsonT);

  @override
  Future<ApiResponse<T>> patch<T>(
    ApiRequest request,
    T Function(Object?) fromJsonT, {
    int successStatusCode = 200,
  }) => _request<T>(
    request,
    method: 'PATCH',
    fromJsonT: fromJsonT,
    successStatusCode: successStatusCode,
  );


  Future<ApiResponse<T>> _request<T>(
    ApiRequest request, {
    required String method,
    required T Function(Object?) fromJsonT,
    int successStatusCode = 200,
  }) async {
    try {
      final response = await _dio.request(
        request.url,
        data:  request.body,
        queryParameters: request.params,
        options: Options(method: method, headers: _buildHeaders(request)),
      );

      if (response.statusCode != successStatusCode &&
          response.statusCode != 200) {
        throw NetworkExceptions.handleResponse(response);
      }

      final data = response.data['result'];
      final result = fromJsonT(data);
      return ApiResponse<T>(
        result: result,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );

    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }


}
