// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // To pick images from the gallery or camera
// import 'dart:io'; // To handle file system
// import 'package:dio/dio.dart';
// import 'package:skin/services/loginApi.dart'; // For making HTTP requests

// class UploadImageScreen extends StatefulWidget {
//   const UploadImageScreen({super.key});

//   @override
//   _UploadImageScreenState createState() => _UploadImageScreenState();
// }

// class _UploadImageScreenState extends State<UploadImageScreen> {
//   String _imagePath = ''; // To store the image path for display
//   String _diseaseResult = ''; // To store the disease result from API

//   final ImagePicker _picker = ImagePicker(); // Instance for picking images
//   final Dio _dio = Dio(); // Instance for making API requests

//   // API endpoint
//   final String apiUrl = '$baseUrl/detect/'; // Replace with your actual API URL

//   // Function to pick an image from gallery or camera
//   Future<void> _pickImage() async {
//     final XFile? image = await _picker.pickImage(
//       source: ImageSource.gallery, // Change to ImageSource.camera if you want to use the camera
//     );

//     if (image != null) {
//       setState(() {
//         _imagePath = image.path;
//       });
//       // After selecting the image, upload it to the server
//       await _uploadImage(image);
//     }
//   }

//   // Function to upload the image to the API
//   Future<void> _uploadImage(XFile image) async {

//     try {
//       // Create FormData to send as multipart
//       FormData formData = FormData.fromMap({
//         'image': await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
//       });

//       // Send POST request to the API
//       Response response = await _dio.post(apiUrl, data: formData);
//       print(response.data);  // To print the response for debugging

//       // Check if the request was successful
//       if (response.statusCode == 200) {
//         // Extract the detected object class and score from the response
//         List<dynamic> detectedObjects = response.data['detected_objects'];
//         if (detectedObjects.isNotEmpty) {
//           // Assuming we want to display the first object detected
//           var detectedObject = detectedObjects[0];
//           String diseaseClass = detectedObject['class'];
//           double confidenceScore = detectedObject['score'];

//           setState(() {
//             // Display the class and confidence score
//             _diseaseResult = 'Detected Disease: $diseaseClass\nConfidence Score: ${confidenceScore.toStringAsFixed(2)}';
//           });
//         } else {
//           setState(() {
//             _diseaseResult = 'No disease detected';
//           });
//         }
//       } else {
//         setState(() {
//           _diseaseResult = 'Error: ${response.statusCode}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _diseaseResult = 'Error: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload Image'),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromARGB(255, 127, 27, 235),
//               Color.fromARGB(255, 95, 139, 216),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Upload Image',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Container(
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       // Display the selected image if there is one
//                       _imagePath.isNotEmpty
//                           ? Image.file(File(_imagePath))
//                           : const Text(
//                               'No image selected',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 16, color: Colors.black),
//                             ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: _pickImage,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF6A11CB),
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: const Text(
//                           'Upload Image',
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // Display the disease result from the API
//                       if (_diseaseResult.isNotEmpty)
//                         Text(
//                           _diseaseResult,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black87,
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:skin/services/loginApi.dart';

// class UploadImageScreen extends StatefulWidget {
//   const UploadImageScreen({super.key});

//   @override
//   _UploadImageScreenState createState() => _UploadImageScreenState();
// }

// class _UploadImageScreenState extends State<UploadImageScreen> {
//   String _imagePath = '';
//   String _diseaseResult = '';
//   final ImagePicker _picker = ImagePicker();
//   final Dio _dio = Dio();

//   // API endpoint
//   final String apiUrl = '$baseUrl/detect/'; // Replace with your actual API URL

//   Future<void> _pickImage() async {
//     final XFile? image = await _picker.pickImage(
//       source: ImageSource.gallery,
//     );

//     if (image != null) {
//       setState(() {
//         _imagePath = image.path;
//       });

//       // Upload image to server
//       await _uploadImage(image);
//     }
//   }

//   Future<void> _uploadImage(XFile image) async {
//     try {
//       FormData formData = FormData.fromMap({
//         'image': await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
//       });

//       Response response = await _dio.post(apiUrl, data: formData);

//       if (response.statusCode == 200) {
//         List<dynamic> detectedObjects = response.data['detected_objects'];

//         if (detectedObjects.isNotEmpty) {
//           var detectedObject = detectedObjects[0];
//           String diseaseClass = detectedObject['class'];
//           double confidenceScore = detectedObject['score'];

//           setState(() {
//             _diseaseResult = 'Disease: $diseaseClass\nConfidence: ${confidenceScore.toStringAsFixed(2)}';
//           });
//         } else {
//           setState(() {
//             _diseaseResult = 'No disease detected';
//           });
//         }
//       } else {
//         setState(() {
//           _diseaseResult = 'Error: ${response.statusCode}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _diseaseResult = 'Error: $e';
//       });
//     }
//   }

//   void _viewDetails() {
//     if (_imagePath.isNotEmpty && _diseaseResult.isNotEmpty) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ViewImageDetailsScreen(
//             imagePath: _imagePath,
//             details: _diseaseResult,
//           ),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No image or result available')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload Image'),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromARGB(255, 127, 27, 235),
//               Color.fromARGB(255, 95, 139, 216),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Upload Image',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Container(
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       _imagePath.isNotEmpty
//                           ? Image.file(File(_imagePath), height: 200)
//                           : const Text(
//                               'No image selected',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 16, color: Colors.black),
//                             ),
//                       const SizedBox(height: 20),

//                       // Upload Image Button
//                       ElevatedButton(
//                         onPressed: _pickImage,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF6A11CB),
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: const Text(
//                           'Upload Image',
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                       ),

//                       const SizedBox(height: 20),

//                       // View Details Button
//                       ElevatedButton(
//                         onPressed: _viewDetails,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: const Text(
//                           'View Details',
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                       ),

//                       const SizedBox(height: 20),
//                       if (_diseaseResult.isNotEmpty)
//                         Text(
//                           _diseaseResult,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black87,
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ViewImageDetailsScreen extends StatelessWidget {
//   final String imagePath;
//   final String details;

//   const ViewImageDetailsScreen({
//     super.key,
//     required this.imagePath,
//     required this.details,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Details'),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromARGB(255, 127, 27, 235),
//               Color.fromARGB(255, 95, 139, 216),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.file(File(imagePath), height: 300),
//                 const SizedBox(height: 20),
//                 Text(
//                   details,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('Back'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:skin/screns/report.dart';
import 'package:skin/services/loginApi.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  String _imagePath = '';
  String _diseaseResult = '';
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();

  // API endpoint
  final String apiUrl = '$baseUrl/detect/'; // Replace with your actual API URL

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });

      // Upload image to server
      await _uploadImage(image);
    }
  }

  // Function to take image using the camera
  Future<void> _takeImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });

      // Upload image to server
      await _uploadImage(image);
    }
  }

  // Function to upload image to the server
  Future<void> _uploadImage(XFile image) async {
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image.path,
          filename: 'image.jpg',
        ),
        "User": loginId,
      });

      Response response = await _dio.post(apiUrl, data: formData);

      if (response.statusCode == 200) {
        List<dynamic> detectedObjects = response.data['detected_objects'];

        if (detectedObjects.isNotEmpty) {
          var detectedObject = detectedObjects[0];
          String diseaseClass = detectedObject['class'];
          double confidenceScore = detectedObject['score'];

          setState(() {
            _diseaseResult =
                'Disease: $diseaseClass\nConfidence: ${confidenceScore.toStringAsFixed(2)}';
          });
        } else {
          setState(() {
            _diseaseResult = 'No disease detected';
          });
        }
      } else {
        setState(() {
          _diseaseResult = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _diseaseResult = 'Error: $e';
      });
    }
  }

  // View the report details
  void _viewDetails() {
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ViewImageDetailsScreen(
                imagePath: _imagePath,
                details: _diseaseResult,
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1976D2), // Blue,
        // title: const Text('Upload Image'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Color.fromARGB(255, 127, 27, 235),
              Color(0xFF1976D2), // Blue
              Color(0xFF64B5F6),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Upload Image',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                // First Card - Upload Image from Gallery
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.image, size: 40),
                    title: const Text('Upload Image from Gallery'),
                    onTap: _pickImage,
                  ),
                ),
                const SizedBox(height: 20),

                // Second Card - Take Image with Camera
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.camera_alt, size: 40),
                    title: const Text('Take Image with Camera'),
                    onTap: _takeImage,
                  ),
                ),
                const SizedBox(height: 20),

                // Third Card - View Report
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.report, size: 40),
                    title: const Text('View Disease Report'),
                    onTap: _viewDetails,
                  ),
                ),
                const SizedBox(height: 20),

                if (_diseaseResult.isNotEmpty)
                  Text(
                    _diseaseResult,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
