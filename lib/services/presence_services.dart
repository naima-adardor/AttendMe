import 'dart:convert';
import 'dart:io';

import 'package:attend_me/models/Presence.dart';
import 'package:attend_me/services/user-services.dart';

import '../constants/constants.dart';
import '../models/Assignment.dart';
import '../models/api-response.dart';
import 'package:http/http.dart' as http;

//get Presences
Future<ApiResponse> getPresences(int id_employee) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    Map<String, dynamic> requestBody;
    requestBody = {
      'id_employee': id_employee.toString(),
    };
    final response = await http.post(
      Uri.parse(PresenceURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );

    switch (response.statusCode) {
      case 200:
        List<dynamic> data = jsonDecode(response.body)['presence'];
        List<Presence> presence =
            data.map((e) => Presence.fromJson(e)).toList();
        apiResponse.data = presence;
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        print(response.statusCode);
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);

    apiResponse.error = serverError;
  }
  return apiResponse;
}

//get Presence by ID
Future<ApiResponse> getPresenceById(String idPresence) async {
  print("start");
  ApiResponse apiResponse = ApiResponse();
  try {
    print("try");
    String token = await getToken();
    Map<String, dynamic> requestBody = {
      'id_presence': idPresence,
    };
    print("pass map");

    final response = await http.post(
      Uri.parse(PresenceIDURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );

    print("pass post");

    switch (response.statusCode) {
      case 200:
        print(200);
        apiResponse.data = Presence.fromJson(jsonDecode(response.body));
        print(apiResponse.data);
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        print(response.statusCode);
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }
  return apiResponse;
}

//get Id Presence
Future<ApiResponse> getIdPres(String id_employee, String id_elevator,
    String check_in, String attendance_day) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    Map<String, dynamic> requestBody;
    requestBody = {
      'id_employee': id_employee,
      'id_elevator': id_elevator,
      'check_in': check_in,
      'attendance_day': attendance_day,
    };
    final response = await http.post(
      Uri.parse(getIdPresence),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = Presence.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 422:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        print(response.body);
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    // Network or server error
    print(e);
    apiResponse.error = 'Server error';
  }
  return apiResponse;
}

String? getStringImage(File? file) {
  if (file == null) return null;
  return base64Encode(file.readAsBytesSync());
}

//fetch presence
Future<List<Map<String, dynamic>>> getPresenceByIdEmp(int idEmployee) async {
  ApiResponse apiResponse = ApiResponse();
  String token = await getToken();
  Map<String, dynamic> requestBody;
  requestBody = {
    'id_employee': idEmployee.toString(),
  };
  final response = await http.post(
    Uri.parse(getPreById),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: requestBody,
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<Map<String, dynamic>> presenceList = [];

    for (var presenceData in data) {
      presenceList.add({
        'day': presenceData['day'],
        'status': presenceData['status'],
        'employee': presenceData['employee'],
        'id_employee': presenceData['id_employee'],
        'check_in': presenceData['check_in'],
        'check_out': presenceData['check_out'],
        'selfie': presenceData['selfie'],
        'qrcode': presenceData['qrcode'],
        'elevator': presenceData['elevator'],
      });
    }

    return presenceList;
  } else {
    throw Exception('Failed to fetch presence');
  }
}

// add Presence
Future<ApiResponse> addPres(
  String id_elevator,
  String id_employee,
  String check_in,
  String attendance_day,
  String selfie,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    Map<String, dynamic> requestBody;

    requestBody = {
      'id_elevator': id_elevator,
      'id_employee': id_employee,
      'check_in': check_in,
      'attendance_day': attendance_day,
      'selfie': selfie,
    };

    final response = await http.post(
      Uri.parse(addPresence),
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

// update Presence
Future<ApiResponse> updatePres(
  String id_presence,
  String? check_out,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    Map<String, dynamic> requestBody;

    requestBody = {
      'id_presence': id_presence,
      'check_out': check_out,
    };

    final response = await http.put(
      Uri.parse(updatePresence),
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
