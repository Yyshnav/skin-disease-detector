import 'package:flutter/material.dart';
import 'package:skin/screns/login.dart';
import 'package:skin/services/loginApi.dart';

Future<Map<String, dynamic>> registerApi({
  required String username,
  required String password,
  required String email,
  required String phone,
  required String age,
  required String gender,
  required String address,
  required String medical,
  required BuildContext context,
}) async {
  try {
    final response = await dio.post(
      '$baseUrl/RegApi',
      data: {
        'Name': username,
        "Age": age,
        "Gender": gender,
        "username": email,
        "Address": address,
        'password': password,
        'Email': email,
        "Phone": phone,
        "type": "user",
        "medical": medical,
      },
    );
    print("eeeeee$response");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => lo()),
    );

    return response.data;
  } catch (e) {
    print('Register error: $e');
    return {'error': e.toString()};
  }
}
