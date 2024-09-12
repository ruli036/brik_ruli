import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect{
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';

  ApiService() {
    httpClient.baseUrl = baseUrl;
    httpClient.timeout = const Duration(seconds: 10);
    httpClient.defaultContentType = 'application/json';
  }

  Future<Response<dynamic>> getData(String endpoint) async {
    try {
      final response = await get(endpoint);

      if (response.status.hasError) {
        handleError(response.statusCode, "Error");
        return Response(statusCode: response.statusCode, statusText: response.statusText);
      } else {
        // Proses data jika respons berhasil
        print('Success: ${response.body}');
        return response;
      }
    } catch (e) {
      // Tangani timeout atau kesalahan jaringan
      handleError(null, e.toString());
      // Mengembalikan response kosong atau dengan error jika diperlukan
      return Response(statusCode: null, statusText: e.toString());
    }
  }

  void handleError(int? statusCode, String errorMessage) {
    if (statusCode == null) {
      // Kesalahan jaringan atau timeout
      print('Network error or timeout: $errorMessage');
      // Tampilkan pesan kesalahan kepada pengguna atau log
    } else {
      // Kesalahan dari server, misalnya 404, 500, dll.
      print('Error $statusCode: $errorMessage');
      // Tampilkan pesan kesalahan kepada pengguna atau log
    }
  }
}

