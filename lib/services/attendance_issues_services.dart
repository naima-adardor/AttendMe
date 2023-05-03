import 'dart:convert';

import 'package:attend_me/Screens/attendance_regulation.dart';
import 'package:attend_me/services/user-services.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/AttendanceIssues.dart';
import '../models/api-response.dart';

import 'package:http/http.dart' as http;

// add Attendance Issues
Future<ApiResponse> addAttIssues(
  String check_in,
  String check_out,
  String attendance_day,
  String issue_type,
  String status,
  String report,
  String id_employee,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    Map<String, dynamic> requestBody;

    requestBody = {
      'check_in': check_in,
      'check_out': check_out,
      'attendance_day': attendance_day,
      'issue_type': issue_type,
      'status': status,
      'report': report,
      'id_employee': id_employee,
    };

    final response = await http.post(
      Uri.parse(addAttIssuesURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }
  return apiResponse;
}
