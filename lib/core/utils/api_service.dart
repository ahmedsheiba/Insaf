import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);

  final _baseUrl = 'https://lightgreen-bear-560971.hostingersite.com/api/';
  final Dio _dio;

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic data,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          "Accept": "application/json",
        },
      ),
    );
    return response.data;
  }
}
