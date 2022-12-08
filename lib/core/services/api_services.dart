// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:lab_management_app/core/utils/constant.dart';

class ApiService {
  final _dio = Dio(BaseOptions(baseUrl: baseUrl));

  // /signup

  Future signUp({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dio
          .post(
            "/signup",
            data: body,
          )
          .timeout(const Duration(seconds: 15));
      return response;
    } on TimeoutException {
      return timedOutResponse;
    } on SocketException {
      return socketResponse;
    }
  }

  Future login({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dio
          .post(
            "/login",
            data: body,
          )
          .timeout(const Duration(seconds: 15));
      return response;
    } on TimeoutException {
      return timedOutResponse;
    } on SocketException {
      return socketResponse;
    }
  }

  http.Response socketResponse = http.Response(
    jsonEncode(
      {"message": "No internet connection"},
    ),
    404,
  );

  http.Response timedOutResponse = http.Response(
    jsonEncode(
      {"message": "Request Timed out"},
    ),
    408,
  );

  http.Response ioResponse = http.Response(
    jsonEncode(
      {"message": "Request Timed out"},
    ),
    408,
  );
}
