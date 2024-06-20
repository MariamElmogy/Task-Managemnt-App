import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  postRequest(
      {required String url,
      required Map data,
      String? authorizationHeader}) async {
    try {
      final response = await Dio().post(
        url,
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: authorizationHeader,
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.data;
        return data;
      } else {
        log('post error: ${response.statusCode}');
      }
    } catch (e) {
      log('post exception: $e');
    }
  }

  getRequest({required String url, String? authorizationHeader}) async {
    try {
      final response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: authorizationHeader,
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        var data = response.data;
        return data;
      } else {
        log('post error: ${response.statusMessage}');
      }
    } catch (e) {
      log('post exception: $e');
    }
  }

  putRequest(
      {required String url,
      required Map data,
      String? authorizationHeader}) async {
    try {
      final response = await Dio().put(
        url,
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: authorizationHeader,
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        var data = response.data;
        return data;
      } else {
        log('post error: ${response.statusMessage}');
      }
    } catch (e) {
      log('post exception: $e');
    }
  }
  deleteRequest(
      {required String url,
      required Map data,
      String? authorizationHeader}) async {
    try {
      final response = await Dio().delete(
        url,
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: authorizationHeader,
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        var data = response.data;
        return data;
      } else {
        log('post error: ${response.statusMessage}');
      }
    } catch (e) {
      log('post exception: $e');
    }
  }
}



// Options options = Options(
//   headers: {
//     HttpHeaders.authorizationHeader: '',
//     HttpHeaders.contentTypeHeader: 'application/json',
//   },
// );
