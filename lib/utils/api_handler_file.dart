import 'dart:convert';
import 'package:api/config/api_endpoint.dart';
import 'package:api/config/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

class HttpHandler {
  static String endPointUrl = APIEndpoints.baseURL;
  static Future<Map<String, String>> _getHeaders() async {
    final String? token =
        PrefString.sharedPreferences.getString(PrefString.token);
    if (token != null) {
      return {
        'Content-type': 'application/json',
        'authorization': token,
      };
    } else {
      return {
        'Content-type': 'application/json',
      };
    }
  }

  static Future<Map<String, dynamic>> postHttpMethod({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();
    debugPrint("Post Body ======= $data");
    debugPrint("Post Header ======= $header");

    final response = await dio.Dio()
        .post("$endPointUrl$url", data: data, queryParameters: header);

    debugPrint("Post data =-= $data");
    debugPrint("Post body =-= ${response.data}");
    debugPrint("Post status =-= ${response.statusCode}");

    if (response.statusCode == 200) {
      Map<String, dynamic> data = {
        'body': response.data,
        'headers': response.headers,
        'error_description': null,
      };
      return data;
    } else if (response.statusCode == 400) {
      Map<String, dynamic> data = {
        'body': response.data,
        'headers': response.headers,
        'error_description': "400",
      };
      return data;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> data = {
        'body': response.data,
        'headers': response.headers,
        'error_description': "401",
      };
      return data;
    } else if (response.statusCode == 403) {
      Map<String, dynamic> data = {
        'body': response.data,
        'headers': response.headers,
        'error_description': "403",
      };
      return data;
    } else if (response.statusCode == 404) {
      Map<String, dynamic> data = {
        'body': response.data,
        'headers': response.headers,
        'error_description': "404",
      };
      return data;
    } else if (response.statusCode == 500) {
      Map<String, dynamic> data = {
        'body': response.data,
        'headers': response.headers,
        'error_description': "500",
      };
      return data;
    } else {
      return {
        'body': null,
        'headers': null,
        'error_description': "Something Went Wrong",
      };
    }
  }

  static Future<Map<String, dynamic>> getHttpMethod({
    required String url,
    String? token,
  }) async {
    var header = await _getHeaders();
    debugPrint("header is ===== $header");
    http.Response response =
        await http.get(Uri.parse("$endPointUrl$url"), headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': null,
      };
      return data;
    } else if (response.statusCode == 400) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "400",
      };
      return data;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "401",
      };

      return data;
    } else if (response.statusCode == 403) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "403",
      };
      return data;
    } else if (response.statusCode == 404) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "404",
      };
      return data;
    } else if (response.statusCode == 500) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "500",
      };
      return data;
    } else {
      return {
        'body': null,
        'headers': null,
        'error_description': "Something Went Wrong",
      };
    }
  }

  static Future putHttpMethod({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    var header = await _getHeaders();
    debugPrint("header is ===== $header");
    http.Response response = await http.put(
      Uri.parse("$endPointUrl$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': null,
      };
      return data;
    } else if (response.statusCode == 400) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "400",
      };
      return data;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "400",
      };
      return data;
    } else if (response.statusCode == 403) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "403",
      };
      return data;
    } else if (response.statusCode == 404) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "404",
      };
      return data;
    } else if (response.statusCode == 500) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "500",
      };
      return data;
    } else {
      return {
        'body': null,
        'headers': null,
        'error_description': "Something Went Wrong",
      };
    }
  }

  static Future deleteHttpMethod({
    required String url,
    String? token,
  }) async {
    var header = await _getHeaders();
    debugPrint("header is ===== $header");
    http.Response response = await http.delete(
      Uri.parse("$endPointUrl$url"),
      headers: header,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': null,
      };
      return data;
    } else if (response.statusCode == 400) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "400",
      };
      return data;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "404",
      };
      return data;
    } else if (response.statusCode == 403) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "403",
      };
      return data;
    } else if (response.statusCode == 404) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "404",
      };
      return data;
    } else if (response.statusCode == 500) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': "500",
      };
      return data;
    } else {
      return {
        'body': null,
        'headers': null,
        'error_description': "Something Went Wrong",
      };
    }
  }
}
