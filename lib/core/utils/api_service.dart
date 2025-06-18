import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);

  final _baseUrl = 'https://lightgreen-bear-560971.hostingersite.com/';
  final Dio _dio;

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
