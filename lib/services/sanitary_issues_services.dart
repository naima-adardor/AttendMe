import 'dart:convert';
import 'dart:io';

import 'package:attend_me/services/user-services.dart';

import '../constants/constants.dart';
import '../models/api-response.dart';

import 'package:http/http.dart' as http;

// add Attendance Issues
Future<ApiResponse> addSanitary(
  String id_employee,
  String report,
  String? certificate,
  String extension,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    Map<String, dynamic> requestBody;

    requestBody = {
      'id_employee': id_employee,
      'report': report,
      'certificate': certificate,
      'extension': extension,
    };

    final response = await http.post(
      Uri.parse(addSanitaryURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );

    switch (response.statusCode) {
      case 200:
        print("200");
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 422:
        print("422");
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }

    print('Response body: ${response.body}');
    print('Status code: ${response.statusCode}');
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }

  return apiResponse;
}
