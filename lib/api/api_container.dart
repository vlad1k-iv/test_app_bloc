import 'dart:developer';

import 'package:dio/dio.dart';

class ApiContainer{

static final ApiContainer _singleton = ApiContainer._initialize();

factory ApiContainer(){
  return _singleton;
}
static const _baseUrl = 'https://api.unsplash.com';

  BaseOptions _options = BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: Duration(milliseconds: 32000),
    receiveTimeout: Duration(milliseconds: 32000),
    
    headers: {
      Headers.contentTypeHeader: 'application/json',
      Headers.acceptHeader: 'application/json',
    },
  );
  late Dio _client = Dio();

ApiContainer._initialize(){
  _client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          String requestString = "";
          requestString = "\n----------REQUEST---------";
          requestString += "\nURL:\n${options.uri.toString()}";
          requestString += "\n------\nHEADERS:\n${options.headers}\n----\n";
          requestString += "\n----------END REQUEST---------";
          log(requestString);
          handler.next(options);
        },
        onResponse: (Response response, handler) {
          String requestString = "";
          requestString = "\n----------RESPONSE SUCCESS---------";
          requestString += "\nURL:\n${response.requestOptions.uri.toString()}";
          requestString += "\n\nDATA:\n${response.data}";
          // requestString += "\n------\nHEADERS:\n${response.headers}\n----\n";
          requestString += "\n----------END RESPONSE---------";
          log(requestString);
          handler.next(response);
        },
        onError: (e, handler) {
          String requestString = "";
          requestString = "\n----------RESPONSE ERROR---------";
          requestString += "\nURL:\n${e.requestOptions.uri.toString()}";
          if (e.response != null) {
            requestString += "\nCODE:${e.response?.statusCode?.toString()}";
            requestString += "\nERROR:\n${e.response?.toString()}";
          } else if (e.error != null) {
            requestString += "\nERROR:\n${e.error?.toString()}";
          } else {
            requestString += "\nERROR:\n${e.toString()}";
          }
          requestString += "\n----------END RESPONSE---------";
          log(requestString);

          handler.next(e);
        },
      ),
    );
} 

  Future<T> post<T>({String? baseUrl, required String path, dynamic parameters, Map<String, dynamic>? queryParam}) async {
    try {
      _configureClient(baseUrl: baseUrl);
      var response = await _client.post(path, data: parameters, queryParameters: queryParam);
      return response as T;
    } catch (e) {
      throw e;
    }
  }
    Future<T> get<T>({String? baseUrl, required String path, Map<String, dynamic>? queryParam}) async {
    try {
      _configureClient(baseUrl: baseUrl);
      var response = await _client.get(path, queryParameters: queryParam);
      return response as T;
    } catch (e) {
      throw e;
    }
  }

  setToken(String token) {
    _client.options..headers["Authorization"] = "Bearer " + token;
  }

  removeToken() {
    _client.options..headers.remove("Authorization");
  }
    _configureClient({String? baseUrl, String? acceptType}) {
    _client.options.baseUrl = baseUrl ?? _baseUrl;
    _client.options.headers[Headers.acceptHeader] = acceptType != null ? acceptType : "application/json";
  }
}