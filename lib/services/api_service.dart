import 'package:dio/dio.dart';

class ApiService {
  Dio _dio = Dio();

  static const loginUrl = 'http://pod.mobiuslogistics.biz/auth';

  Future<APIResponse> login(String companyCode, String accessCode) async {
    Map<String, dynamic> data = Map();
    data['companyCode'] = (companyCode);
    data['accessCode'] = (accessCode);

    FormData formData = FormData();
    formData = FormData.fromMap(data);

    try {
      var response = await _dio.post(loginUrl, data: formData);
      return APIResponse(data: response.data['token'], isSuccess: true);
    } catch (e) {
      print(e);
      String error = e.response == null ? e.message : e.response.data['error'];
      throw APIResponse(data: error, isSuccess: false);
    }
  }
}

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class APIResponse {
  String data;
  bool isSuccess;

  APIResponse({this.data, this.isSuccess});
}
