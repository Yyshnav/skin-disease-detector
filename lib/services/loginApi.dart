import 'package:dio/dio.dart';


import 'package:flutter/material.dart';
import 'package:skin/screns/homepage.dart';

final Dio dio = Dio();
 String baseUrl = '';
int? loginId;

Future<Map<String, dynamic>> loginApi({
  required String username,
  required String password,
  required BuildContext context,
}) async {
  // Replace with your actual base URL

  try {
    final response = await dio.post(
      '$baseUrl/LoginPageApi',
      data: {
        'username': username,
        'password': password,
      },
    );

    print(response);

    // Check if the response data contains the "login_id" field and it's not null
    if (response.data != null && response.data["login_id"] != null) {
      loginId = response.data["login_id"];
      // Proceed to the next screen
     Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => const HomePage(),
  ),
  (Route<dynamic> route) => false, // This will remove all previous routes
);

      return response.data;
    } else {
      // Handle case where login_id is missing or invalid
      print("Error: Missing login_id in response.");
      return {'error': 'Login failed. Missing login_id.'};
    }
  } catch (e) {
    print('Login error: $e');
    return {'error': e.toString()};
  }
}
