import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:get/get_connect/connect.dart';

import '../exception/app_exception.dart';
import 'api_request_interface.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future request(APIRequestInterface request) async {
    log("On API Provide Request is ${request.endpoint}");
    try {
      final response = await _client.request(
        request.endpoint,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body,
      );
      log("On API Provide Response is ${response.statusCode}");
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
