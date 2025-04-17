import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:skin/services/loginApi.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final TextEditingController _complaintController = TextEditingController();
  final Dio _dio = Dio();
  bool isLoading = false;
  bool isFetchingReplies = false;
  List<Map<String, dynamic>> complaintsWithReplies = [];

  Future<void> _submitComplaint() async {
    String complaintTextInput = _complaintController.text.trim();

    if (complaintTextInput.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your complaint')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final apiUrl = '$baseUrl/submitComplaint/$loginId';

    try {
      final response = await _dio.post(
        apiUrl,
        data: {'Complaint': complaintTextInput, 'Reply': ''},
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Complaint submitted successfully!')),
        );
        _complaintController.clear();
        await _fetchReplies();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to submit complaint.')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Unable to submit complaint.')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchReplies() async {
    setState(() {
      isFetchingReplies = true;
    });

    final apiUrl = '$baseUrl/submitComplaint/$loginId';

    try {
      final response = await _dio.get(apiUrl);
      if (response.statusCode == 200 && response.data is List) {
        List<Map<String, dynamic>> fetchedComplaintsWithReplies = [];

        for (var complaint in response.data) {
          if (complaint is Map) {
            fetchedComplaintsWithReplies.add({
              'Complaint': complaint['Complaint'] ?? '',
              'Reply': complaint['Reply'] ?? '',
              'User': complaint['User'] ?? 0,
              'Date': complaint['Date'] ?? '', // Now handles Date field
            });
          }
        }

        setState(() {
          complaintsWithReplies = fetchedComplaintsWithReplies;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch replies')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Unable to fetch replies.')),
      );
    } finally {
      setState(() {
        isFetchingReplies = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchReplies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 8, 117, 206)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 8, 117, 206),
              Color.fromARGB(255, 8, 117, 206),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Submit Your Complaint',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: _complaintController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'Your Complaint',
                          hintText: 'Enter your complaint here...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: isLoading ? null : _submitComplaint,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            8,
                            117,
                            206,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child:
                            isLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : const Text(
                                  'Submit Complaint',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                isFetchingReplies
                    ? const CircularProgressIndicator()
                    : complaintsWithReplies.isNotEmpty
                    ? Expanded(
                      child: ListView.builder(
                        itemCount: complaintsWithReplies.length,
                        itemBuilder: (context, index) {
                          var complaint = complaintsWithReplies[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Complaint:\n${complaint['Complaint']}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Date:\n${complaint['Date']}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Reply:\n${complaint['Reply']}",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    : const Text(
                      'No complaints found.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
