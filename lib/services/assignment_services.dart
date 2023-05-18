import 'dart:convert';

import 'package:attend_me/services/user-services.dart';

import '../constants/constants.dart';
import '../models/Assignment.dart';
import '../models/api-response.dart';
import 'package:http/http.dart' as http;

//get Assignment
Future<ApiResponse> getAssignments(int id_employee) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    Map<String, dynamic> requestBody;
    requestBody = {
      'id_employee': id_employee.toString(),
    };
    final response = await http.post(
      Uri.parse(assignmentURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );

    switch (response.statusCode) {
      case 200:
        List<dynamic> data = jsonDecode(response.body)['assignments'];
        List<Assignment> assignments =
            data.map((e) => Assignment.fromJson(e)).toList();
        apiResponse.data = assignments;
        break;
      case 401:
        apiResponse.error = unauthorized;
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
