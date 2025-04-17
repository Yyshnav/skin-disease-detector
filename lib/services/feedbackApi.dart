import 'package:flutter/material.dart';
import 'package:skin/services/loginApi.dart';

Future<Map<String, dynamic>> feedbackApi({
  required feedback,
  required rating,
  required context,
}) async {
  try {
    final response = await dio.post(
      '$baseUrl/addfeedback',
      data: {"Feedback": feedback, "Rating": rating, "lid": loginId},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted with rating !')),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error submitting !')));
    }
    print("eeeeee$response");

    return response.data;
  } catch (e) {
    print('Register error: $e');
    return {'error': e.toString()};
  }
}
