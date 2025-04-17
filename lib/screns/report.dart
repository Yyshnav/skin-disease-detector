import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skin/services/loginApi.dart';

class ViewImageDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String details;

  const ViewImageDetailsScreen({
    super.key,
    required this.imagePath,
    required this.details,
  });

  @override
  State<ViewImageDetailsScreen> createState() => _ViewImageDetailsScreenState();
}

class _ViewImageDetailsScreenState extends State<ViewImageDetailsScreen> {
  late Dio _dio;
  List<dynamic> apiData = []; // List to hold the API response data
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _dio = Dio();
    _fetchDataFromApi();
  }

  Future<void> _fetchDataFromApi() async {
    try {
      // Replace with your actual API endpoint
      final String apiUrl = '$baseUrl/getreport/$loginId';

      // Making a GET request
      final response = await _dio.get(apiUrl);
      print("API Response: $response");

      if (response.statusCode == 200) {
        setState(() {
          apiData = response.data; // Parse the response to the list
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1976D2),
      appBar: AppBar(
        title: const Text('Image Details'),
        backgroundColor: Color(0xFF1976D2),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              isLoading
                  ? const CircularProgressIndicator() // Show loading indicator
                  : apiData.isEmpty
                  ? const Text('No data available') // Show fallback if no data
                  : ListView.builder(
                    itemCount: apiData.length,
                    itemBuilder: (context, index) {
                      var item = apiData[index];
                      var imageUrl =
                          baseUrl + item['image']; // The relative path=
                      var date = item['Date'];

                      // Assuming the base URL is the server URL for images
                      String fullImageUrl =
                          '$baseUrl$imageUrl'; // Prepend the base URL

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              imageUrl.isNotEmpty
                                  ? Image.network(
                                    imageUrl, // Full image URL
                                    height: 200,
                                    fit: BoxFit.cover,
                                  )
                                  : const Text('No image available'),
                              const SizedBox(height: 10),
                              Text(
                                'Date: $date',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
