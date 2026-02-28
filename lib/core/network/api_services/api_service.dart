import '../../data/models/api_request.dart';
import '../../data/models/api_response.dart';

abstract class ApiServices {
  Future<ApiResponse> get<T>(ApiRequest request, T Function(Object?) fromJsonT);

  Future<ApiResponse> post<T>(
    ApiRequest request,
    T Function(Object?) fromJsonT, {
    int successStatusCode = 200,
  });

  Future<ApiResponse> put<T>(
    ApiRequest request,
    T Function(Object?) fromJsonT, {
    int successStatusCode = 200,
  });

  Future<ApiResponse> delete<T>(
    ApiRequest request,
    T Function(Object?) fromJsonT,
  );

  Future<ApiResponse> patch<T>(
    ApiRequest request,
    T Function(Object?) fromJsonT, {
    int successStatusCode = 200,
  });
}
