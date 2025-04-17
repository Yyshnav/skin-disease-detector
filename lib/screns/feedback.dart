import 'package:flutter/material.dart';
import 'package:skin/services/feedbackApi.dart';

class FakeProductFeedbackScreen extends StatefulWidget {
  const FakeProductFeedbackScreen({super.key});

  @override
  _FakeProductFeedbackScreenState createState() =>
      _FakeProductFeedbackScreenState();
}

class _FakeProductFeedbackScreenState extends State<FakeProductFeedbackScreen> {
  final TextEditingController _feedbackController = TextEditingController();
  double _rating = 3.0; // Default rating is 3.0

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Feedback',
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
                      // Feedback TextField
                      TextField(
                        controller: _feedbackController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'Your Feedback',
                          hintText: 'Enter your feedback here...',
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

                      // Rating Slider
                      Text(
                        'Rating: ${_rating.toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Slider(
                        activeColor: Color.fromARGB(255, 8, 117, 206),
                        value: _rating,
                        min: 1.0,
                        max: 5.0,
                        divisions: 4,
                        label: _rating.toStringAsFixed(1),
                        onChanged: (value) {
                          setState(() {
                            _rating = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      // Submit Button
                      ElevatedButton(
                        onPressed: () {
                          feedbackApi(
                            feedback: _feedbackController.text,
                            rating: _rating,
                            context: context,
                          );
                          _feedbackController.clear();

                          // Handle feedback submission

                          // Optionally, navigate to another screen
                        },
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
                        child: const Text(
                          'Submit Feedback',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
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
