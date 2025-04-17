// // import 'package:flutter/material.dart';
// // import 'package:skin/screns/complaints.dart';
// // import 'package:skin/screns/feedback.dart';
// // import 'package:skin/screns/imageupload.dart';
// // import 'package:skin/screns/login.dart';

// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Home Page'),
// //         backgroundColor: const Color(0xFF6A11CB),
// //       ),
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [
// //               Color.fromARGB(255, 127, 27, 235),
// //               Color.fromARGB(255, 95, 139, 216),
// //             ],
// //           ),
// //         ),
// //         child: ListView(
// //           padding: const EdgeInsets.all(16.0),
// //           children: [
// //             // Scan QR Code Section with a full-screen image background
// //             _buildSection(
// //               context,
// //               title: 'Scan',
// //               // Add your scanner image here
// //               onTap: () {
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => UploadImageScreen(),
// //                     ));
// //               },
// //             ),
// //             const SizedBox(height: 16),
// //             // Feedback Section with a background image
// //             _buildSection(
// //               context,
// //               title: 'Feedback',

// //               // Add your feedback image here
// //               onTap: () {
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => FakeProductFeedbackScreen(),
// //                     ));
// //               },
// //             ),
// //             const SizedBox(height: 16),
// //              _buildSection(
// //               context,
// //               title: 'Complaints',

// //               // Add your feedback image here
// //               onTap: () {
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => ComplaintScreen(),
// //                     ));
// //               },
// //             ),
// //             const SizedBox(height: 16),
// //             // Logout Section with a background image
// //             _buildSection(
// //               context,
// //               title: 'Logout',
// //               // Add your logout image here
// //               onTap: () {
// //                 _showLogoutDialog(context);
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // Custom widget to build each section with an image background
// //   Widget _buildSection(
// //     BuildContext context, {
// //     required String title,
// //     required VoidCallback onTap,
// //   }) {
// //     return Container(
// //       height: 200, // Height for each section
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(
// //           color: Colors.black,
// //         ),
// //       ),
// //       child: InkWell(
// //         onTap: onTap,
// //         child: Center(
// //           child: Text(
// //             title,
// //             style: const TextStyle(
// //               fontSize: 24,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.white,
// //               shadows: [
// //                 Shadow(
// //                   blurRadius: 10,
// //                   color: Colors.black,
// //                   offset: Offset(0, 4),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void _showLogoutDialog(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: const Text('Logout'),
// //           content: const Text('Are you sure you want to log out?'),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop(); // Close dialog
// //               },
// //               child: const Text('Cancel'),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => FakeProductLoginScreen(),
// //                     ));
// //               },
// //               child: const Text('Logout'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:skin/screns/complaints.dart';
// import 'package:skin/screns/doctors.dart';
// import 'package:skin/screns/feedback.dart';
// import 'package:skin/screns/imageupload.dart';
// import 'package:skin/screns/login.dart';
// import 'package:skin/screns/viewbookingstatus.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page', style: TextStyle(fontSize: 24)),
//         backgroundColor: const Color.fromARGB(255, 8, 117, 206),
//         centerTitle: true,
//         elevation: 4.0,
//       ),
//       body: SingleChildScrollView(
//         // Added scroll view for smaller screens
//         child: Container(
//           decoration: const BoxDecoration(color: Colors.white),
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 130,
//           ), // Added padding
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Heading at the Top
//               const Text(
//                 'Skin Cancer Detector', // Heading text
//                 style: TextStyle(
//                   fontSize: 28, // Larger font size
//                   fontWeight: FontWeight.bold, // Bold text
//                   color: Color.fromARGB(255, 8, 117, 206), // Dark blue color
//                 ),
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(height: 10), // Space below the heading

//               const Text(
//                 'Early, Save Lives.', // Subtitle below the heading
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(height: 30), // Space before the image
//               // Scanner Image with Navigation to Image Upload Screen
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UploadImageScreen(),
//                     ),
//                   );
//                 },
//                 child: Image.asset(
//                   'assets/img1.jpg',
//                   width: 180,
//                   height: 180,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Text(
//                 'Scan',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 30), // Space between image and buttons
//               // Column for Feedback, Complaints, and Logout buttons
//               Column(
//                 children: [
//                   // Feedback Button with Image
//                   _buildCustomImageButton(
//                     context: context,
//                     label: '  Feedback  ',
//                     imagePath: 'assets/feeed.jpg',
//                     iconSize: 30,
//                     fontSize: 18,
//                     buttonHeight: 70,
//                     onPressed:
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => FakeProductFeedbackScreen(),
//                           ),
//                         ),
//                   ),
//                   const SizedBox(height: 10),

//                   // Complaints Button with Image
//                   _buildCustomImageButton(
//                     context: context,
//                     label: 'Book Doctor',
//                     imagePath: "assets/commm.jpg",
//                     iconSize: 50,
//                     fontSize: 18,
//                     buttonHeight: 50,
//                     onPressed:
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DoctorBookingScreen(),
//                           ),
//                         ),
//                   ),
//                   const SizedBox(height: 10),
//                   _buildCustomImageButton(
//                     context: context,
//                     label: 'Complaints',
//                     imagePath: "assets/commm.jpg",
//                     iconSize: 50,
//                     fontSize: 18,
//                     buttonHeight: 50,
//                     onPressed:
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ComplaintScreen(),
//                           ),
//                         ),
//                   ),
//                   const SizedBox(height: 10),
//                   _buildCustomImageButton(
//                     context: context,
//                     label: 'View Status',
//                     imagePath: "assets/commm.jpg",
//                     iconSize: 50,
//                     fontSize: 18,
//                     buttonHeight: 50,
//                     onPressed:
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ViewAppointmentStatusScreen(),
//                           ),
//                         ),
//                   ),
//                   const SizedBox(height: 10),

//                   // Logout Button with Image
//                   _buildCustomImageButton(
//                     context: context,
//                     label: '  Logout      ',
//                     imagePath: "assets/loggg.jpg",
//                     iconSize: 30,
//                     fontSize: 18,
//                     buttonHeight: 50,
//                     onPressed: () => _showLogoutDialog(context),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Button with image and text
//   Widget _buildCustomImageButton({
//     required BuildContext context,
//     required String label,
//     required String imagePath,
//     required VoidCallback onPressed,
//     double iconSize = 30,
//     double fontSize = 18,
//     double buttonHeight = 70,
//   }) {
//     return SizedBox(
//       height: buttonHeight,
//       child: TextButton(
//         onPressed: onPressed,
//         style: TextButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           backgroundColor: Colors.transparent,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imagePath,
//               width: iconSize,
//               height: iconSize,
//               fit: BoxFit.contain,
//             ),
//             const SizedBox(width: 10),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Logout confirmation dialog
//   void _showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Logout', style: TextStyle(fontSize: 22)),
//           content: const Text(
//             'Are you sure you want to log out?',
//             style: TextStyle(fontSize: 18),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel', style: TextStyle(fontSize: 18)),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => lo()),
//                 );
//               },
//               child: const Text('Logout', style: TextStyle(fontSize: 18)),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:skin/screns/complaints.dart';
import 'package:skin/screns/doctors.dart';
import 'package:skin/screns/feedback.dart';
import 'package:skin/screns/imageupload.dart';
import 'package:skin/screns/login.dart';
import 'package:skin/screns/post.dart';
import 'package:skin/screns/viewbookingstatus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Default to Scan tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const _HomeContent(),
    const UploadImageScreen(),
    const _AccountContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Scan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 8, 117, 206),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Scan'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.health_and_safety,
              size: 80,
              color: Color.fromARGB(255, 8, 117, 206),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Text(
              'Skin Scan',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 8, 117, 206),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              'Detect early. Act quickly. Save lives.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountContent extends StatelessWidget {
  const _AccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildButton(
            context,
            label: 'Feedback',
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FakeProductFeedbackScreen(),
                  ),
                ),
          ),
          _buildButton(
            context,
            label: 'Book Doctor',
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorBookingScreen(),
                  ),
                ),
          ),
          _buildButton(
            context,
            label: 'Complaints',
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ComplaintScreen()),
                ),
          ),
          _buildButton(
            context,
            label: 'View Status',
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewAppointmentStatusScreen(),
                  ),
                ),
          ),
          _buildButton(
            context,
            label: 'View Posts',
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorPostsScreen()),
                ),
          ),
          _buildButton(
            context,
            label: 'Logout',
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  static Widget _buildButton(
    BuildContext context, {
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: const Color.fromARGB(255, 8, 117, 206),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => lo()),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
    );
  }
}
