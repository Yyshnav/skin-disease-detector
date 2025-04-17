
import 'package:skin/services/loginApi.dart';

Future<String> sendScannedData(String qrData) async {
  try {
    final response = await dio.get(
      "$baseUrl/check_product/456/",
      queryParameters: {
        'scannedData': qrData, // The data being sent in the query parameters
      },
    );
    print(response);

    if (response.statusCode == 200) {
      // Return the response data as a string
      return response.data['message'];
    } else {
      // Handle non-200 status codes
      return 'Failed to send data. Status code: ${response.statusCode}';
    }
  } catch (e) {
    // Handle errors and return a string
    return 'Error sending data: $e';
  }
}
