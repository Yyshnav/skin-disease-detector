import 'package:flutter/material.dart';
import 'package:skin/services/registerApi.dart';

class FakeProductRegisterScreen extends StatefulWidget {
  const FakeProductRegisterScreen({super.key});

  @override
  _FakeProductRegisterScreenState createState() =>
      _FakeProductRegisterScreenState();
}

class _FakeProductRegisterScreenState extends State<FakeProductRegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _detailsController = TextEditingController();
  String _selectedGender = 'Male'; // Default gender selection
  bool _passwordVisible = false; // Visibility toggle
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1976D2), Color(0xFF1976D2)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Register',
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
                        // Username
                        _buildTextField(
                          controller: _usernameController,
                          label: 'Username',
                          hint: 'Enter Username',
                          icon: Icons.person,
                        ),

                        const SizedBox(height: 20),

                        // Email
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          hint: 'Enter Email',
                          icon: Icons.email,
                        ),

                        const SizedBox(height: 20),

                        // Age
                        _buildTextField(
                          controller: _ageController,
                          label: 'Age',
                          hint: 'Enter Age',
                          icon: Icons.calendar_today,
                          keyboardType: TextInputType.number,
                        ),

                        const SizedBox(height: 20),

                        // Gender Radio Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Gender:',
                              style: TextStyle(fontSize: 18),
                            ),
                            Radio(
                              value: 'Male',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value.toString();
                                });
                              },
                            ),
                            const Text('Male'),
                            Radio(
                              value: 'Female',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value.toString();
                                });
                              },
                            ),
                            const Text('Female'),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Password with visibility toggle
                        _buildPasswordField(
                          controller: _passwordController,
                          label: 'Password',
                          hint: 'Enter Password',
                          isVisible: _passwordVisible,
                          onVisibilityToggle: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),

                        const SizedBox(height: 20),

                        // Confirm Password with visibility toggle
                        _buildPasswordField(
                          controller: _confirmPasswordController,
                          label: 'Confirm Password',
                          hint: 'Confirm Password',
                          isVisible: _confirmPasswordVisible,
                          onVisibilityToggle: () {
                            setState(() {
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                            });
                          },
                        ),

                        const SizedBox(height: 20),

                        // Phone Number
                        _buildTextField(
                          controller: _phoneController,
                          label: 'ContactNo',
                          hint: 'Enter Contact No',
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),

                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: _addressController,
                          label: 'Address',
                          hint: 'Enter Address',
                          icon: Icons.place,
                          // keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: _detailsController,
                          label: 'Medical details',
                          hint: 'Enter details',
                          icon: Icons.medical_services_sharp,
                          // keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 20),

                        // Register Button
                        ElevatedButton(
                          onPressed: () => _registerUser(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1976D2),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Go back to Sign In
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Already have an account? Sign In'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to create standard text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
      ),
    );
  }

  // Helper function for password fields with visibility toggle
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool isVisible,
    required VoidCallback onVisibilityToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: onVisibilityToggle,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
      ),
    );
  }

  // Registration Function with Validation
  void _registerUser(BuildContext context) {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match!')));
      return;
    }

    registerApi(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      phone: _phoneController.text,
      age: _ageController.text,
      gender: _selectedGender,
      address: _addressController.text,
      medical: _detailsController.text,
      context: context,
    );
  }
}
