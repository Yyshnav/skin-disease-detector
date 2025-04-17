import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:skin/services/loginApi.dart'; // for loginId
import 'package:intl/intl.dart';

class ViewAppointmentStatusScreen extends StatefulWidget {
  const ViewAppointmentStatusScreen({super.key});

  @override
  State<ViewAppointmentStatusScreen> createState() =>
      _ViewAppointmentStatusScreenState();
}

class _ViewAppointmentStatusScreenState
    extends State<ViewAppointmentStatusScreen> {
  final Dio _dio = Dio();
  bool isLoading = true;
  List<Map<String, dynamic>> appointmentList = [];

  Future<void> fetchAppointmentStatus() async {
    final apiUrl =
        '$baseUrl/BookingStatusApi/$loginId'; // replace with actual endpoint

    try {
      final response = await _dio.get(apiUrl);
      print(response);
      if (response.statusCode == 200 && response.data is List) {
        List<dynamic> data = response.data;
        setState(() {
          appointmentList =
              data
                  .map(
                    (item) => {
                      'doctorName': item['doctor_name'] ?? 'Unknown',
                      'date': item['appointment_date'] ?? '',
                      "book": item['bookingdate'] ?? '',
                      'status': item['status'] ?? 'Pending',
                    },
                  )
                  .toList();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch appointment status.')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred while fetching appointments.'),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAppointmentStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Status'),
        backgroundColor: Color.fromARGB(255, 8, 117, 206),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 117, 206),
              Color.fromARGB(255, 8, 117, 206),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:
            isLoading
                ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
                : appointmentList.isEmpty
                ? const Center(
                  child: Text(
                    'No appointments found.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
                : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: appointmentList.length,
                  itemBuilder: (context, index) {
                    final item = appointmentList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          'Dr. ${item['doctorName']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Appointment Date: ${(item['date'])}'),
                            Text('Booking Date: ${(item['book'])}'),
                          ],
                        ),
                        trailing: Chip(
                          label: Text(
                            item['status'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor:
                              item['status'] == 'Confirmed'
                                  ? Colors.green
                                  : item['status'] == 'Rejected'
                                  ? Colors.red
                                  : Colors.orange,
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
