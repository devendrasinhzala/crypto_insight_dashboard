import 'package:dio/dio.dart';

class ApiClient {

  final Dio _dio;

  ApiClient({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 20),
    Dio? dio,
  }) : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: baseUrl,
                connectTimeout: connectTimeout,
                receiveTimeout: receiveTimeout,
                responseType: ResponseType.json,
                headers: <String, String>{
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ),
            );


  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Exception _mapDioError(DioException error) {
    final message = error.response?.data?['message']?.toString() ??
        error.message ??
        'Something went wrong. Please try again.';
    return Exception(message);
  }
}
