import 'package:flutter/material.dart';
import 'package:skin/screns/login.dart';
import 'package:skin/services/loginApi.dart';

class IPScreen extends StatefulWidget {
  @override
  _IPScreenState createState() => _IPScreenState();
}

class _IPScreenState extends State<IPScreen> {
  final TextEditingController _ipController = TextEditingController();

  void _setBaseURL() {
    String ip = _ipController.text.trim();

    if (ip.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid IP address')),
      );
      return;
    }

    baseUrl = "http://$ip";

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => lo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("IP Configuration"),
        backgroundColor: const Color.fromARGB(255, 8, 117, 206),
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue.shade50.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.wifi,
                  size: 60,
                  color: Color.fromARGB(255, 8, 117, 206),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter Server IP Address",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 117, 206),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _ipController,
                  decoration: InputDecoration(
                    hintText: 'e.g. 192.168.1.10',
                    labelText: 'IP Address',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    signed: false,
                    decimal: true,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _setBaseURL,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: const Color.fromARGB(255, 8, 117, 206),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
