import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../error/exceptions.dart';
import 'api_conusmer.dart';
import 'api_endpoints.dart';
import 'app_interceptor.dart';
import '../../injection_container.dart' as di;
import 'status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = ApiEndpoint.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) => status! < StatusCode.serverFailure;
    client.interceptors.add(di.sl<AppInterceptor>());
    client.interceptors.add(di.sl<LogInterceptor>());
  }

  @override
  Future get(path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await client.get(path, queryParameters: queryParams);

      return response;
    } on DioError catch (error) {
      dynamicDioError(error);
    }
  }

  @override
  Future post(path, Map<String, dynamic>? body,
      Map<String, dynamic>? queryParams) async {
    final bool isFormDataEnabled = false;
    final response = await client.post(
      path,
      queryParameters: queryParams,
      data: body,
    );

    return jsonDecode(response.data.toString());
  }

  dynamicDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unautherized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.notFound:
            throw const ConflictException();

          case StatusCode.serverFailure:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
