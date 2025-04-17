import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:skin/services/loginApi.dart';
import 'package:intl/intl.dart';

class DoctorBookingScreen extends StatefulWidget {
  const DoctorBookingScreen({super.key});

  @override
  _DoctorBookingScreenState createState() => _DoctorBookingScreenState();
}

class _DoctorBookingScreenState extends State<DoctorBookingScreen> {
  final Dio _dio = Dio(); // Initialize Dio for API requests
  bool isLoading = false;
  bool isFetchingDoctors = false;
  List<Map<String, dynamic>> doctors = []; // To store list of doctors
  DateTime? selectedDate; // For storing selected appointment date

  // Function to fetch list of doctors
  Future<void> _fetchDoctors() async {
    setState(() {
      isFetchingDoctors = true;
    });

    final apiUrl =
        '$baseUrl/ViewDoctorApi'; // Replace with your actual endpoint

    try {
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200 && response.data is List) {
        List<dynamic> fetchedDoctors = response.data;
        List<Map<String, dynamic>> doctorList =
            fetchedDoctors.map((doctor) {
              return {
                'id': doctor['id'] ?? 0,
                'name': doctor['name'] ?? 'Unknown',
                'specialization': doctor['specialization'] ?? 'General',
              };
            }).toList();

        setState(() {
          doctors = doctorList;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to fetch doctors: Invalid response')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Unable to fetch doctors.')),
      );
    } finally {
      setState(() {
        isFetchingDoctors = false;
      });
    }
  }

  // Function to book an appointment
  Future<void> _bookAppointment(int doctorId) async {
    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an appointment date.')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final apiUrl =
        '$baseUrl/ViewDoctorApi'; // Replace with your actual endpoint

    try {
      final response = await _dio.post(
        apiUrl,
        data: {
          "userid": loginId,
          'doctorId': doctorId,
          'appointmentDate': DateFormat('yyyy-MM-dd').format(selectedDate!),
        },
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Appointment booked successfully!')),
        );
        setState(() {
          selectedDate = null; // Reset selected date
        });
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to book appointment.')));
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Unable to book appointment.')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDoctors(); // Fetch doctors when screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 8, 117, 206)),
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // const SizedBox(height: 10),
                const Text(
                  'Available Doctors',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                // Date Picker
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        selectedDate == null
                            ? 'Select Appointment Date'
                            : 'Selected: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            8,
                            117,
                            206,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Pick Date',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Doctor List
                isFetchingDoctors
                    ? const CircularProgressIndicator()
                    : doctors.isNotEmpty
                    ? Expanded(
                      child: ListView.builder(
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          var doctor = doctors[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dr. ${doctor['name']}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Specialization: ${doctor['specialization']}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed:
                                        isLoading
                                            ? null
                                            : () =>
                                                _bookAppointment(doctor['id']),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        8,
                                        117,
                                        206,
                                      ),
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
                                              'Book Appointment',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    : const Text(
                      'No doctors found.',
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
