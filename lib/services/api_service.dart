import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:islamic_marriage/utils/api_response.dart';
import 'package:islamic_marriage/utils/app_urls.dart';

class ApiService {

  Future<ApiResponse<dynamic>> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    developer.log(url.toString());
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.get(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');

    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> post({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  })async {
    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.post(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> postWithOutData({
    required String url,
    Map<String, String>? headers,
  })async {
    developer.log(url.toString());
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.post(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> postMultipart({
    required String url,
    required dynamic data,
    required File file,
    Map<String, String>? headers,
  }) async {
    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('File: $file');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final multipartRequest = http.MultipartRequest('POST', Uri.parse(url));
    multipartRequest.headers.addAll(headers ?? AppUrls.requestHeader);
    data.forEach((key, value) => multipartRequest.fields[key] = value.toString());
    String fileField = 'photo';
    multipartRequest.files.add(await http.MultipartFile.fromPath(fileField, file.path));
    final response = await multipartRequest.send();
    final streamResponse = await http.Response.fromStream(response);

    developer.log('Status Code: ${streamResponse.statusCode}');
    developer.log('Body: ${streamResponse.body}');
    return _handleApiResponse(streamResponse);
  }

  Future<ApiResponse<dynamic>> put({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  })async {
    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.put(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> putMultipart({
    required String url,
    required dynamic data,
    File? file,
    Map<String, String>? headers,
  }) async {
    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('File: $file');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final multipartRequest = http.MultipartRequest('PUT', Uri.parse(url));
    multipartRequest.headers.addAll(headers ?? AppUrls.requestHeader);
    data.forEach((key, value) => multipartRequest.fields[key] = value.toString());

    if (file != null) { // Check if file is provided before adding it
      String fileField = 'photo';
      multipartRequest.files.add(await http.MultipartFile.fromPath(fileField, file.path));
    }

    final response = await multipartRequest.send();
    final streamResponse = await http.Response.fromStream(response);

    developer.log('Status Code: ${streamResponse.statusCode}');
    developer.log('Body: ${streamResponse.body}');
    return _handleApiResponse(streamResponse);
  }

  Future<ApiResponse<dynamic>> patch({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  })async {
    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.patch(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }

  ApiResponse<dynamic> _handleApiResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse.success(data: jsonDecode(response.body));
    } else {
      return ApiResponse.error(
          statusCode: response.statusCode, message: jsonDecode(response.body));
    }
  }
}
