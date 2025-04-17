// import 'package:flutter/material.dart';
// import 'package:skin/screns/register.dart';
// import 'package:skin/services/loginApi.dart';

// class FakeProductLoginScreen extends StatefulWidget {
//   const FakeProductLoginScreen({super.key});

//   @override
//   _FakeProductLoginScreenState createState() => _FakeProductLoginScreenState();
// }

// class _FakeProductLoginScreenState extends State<FakeProductLoginScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _rememberMe = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//                   'Login',
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
//                       TextField(
//                         controller: _usernameController,
//                         decoration: InputDecoration(
//                           labelText: 'Username',
//                           hintText: 'Enter User ID or Email',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           contentPadding: const EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 20),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       TextField(
//                         controller: _passwordController,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           hintText: 'Enter Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           contentPadding: const EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 20),
//                         ),
//                         obscureText: true,
//                       ),
//                       // Align(
//                       //   alignment: Alignment.centerRight,
//                       //   child: TextButton(
//                       //     onPressed: () {},
//                       //     child: const Text('Forgot Password?'),
//                       //   ),
//                       // ),
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: _rememberMe,
//                             onChanged: (value) {
//                               setState(() {
//                                 _rememberMe = value!;
//                               });
//                             },
//                           ),
//                           const Text('Remember Me')
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           loginApi(
//                               username: _usernameController.text,
//                               password: _passwordController.text,
//                               context: context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF6A11CB),
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: const Text(
//                           'Sign In',
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     PageRouteBuilder(
//                                       transitionDuration:
//                                           const Duration(milliseconds: 500),
//                                       pageBuilder: (context, animation,
//                                               secondaryAnimation) =>
//                                           const FakeProductRegisterScreen(),
//                                       transitionsBuilder: (context, animation,
//                                           secondaryAnimation, child) {
//                                         return FadeTransition(
//                                           opacity: animation,
//                                           child: child,
//                                         );
//                                       },
//                                     ));
//                               },
//                               child:
//                                   const Text("Don't have an account? Register Now")),
//                         ],
//                       ),
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
// import 'package:animate_do/animate_do.dart';
// import 'package:skin/screns/forgot.dart';
// import 'package:skin/screns/register.dart';
// import 'package:skin/services/loginApi.dart';

// class lo extends StatefulWidget {
//   @override
//   State<lo> createState() => _loState();
// }

// class _loState extends State<lo> {
//   final TextEditingController _usernameController = TextEditingController();

//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 height: 400,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/background.png'),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 child: Stack(
//                   children: <Widget>[
//                     Positioned(
//                       left: 30,
//                       width: 80,
//                       height: 200,
//                       child: FadeInUp(
//                         duration: Duration(seconds: 1),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage('assets/light-1.png'),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 140,
//                       width: 80,
//                       height: 150,
//                       child: FadeInUp(
//                         duration: Duration(milliseconds: 1200),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage('assets/light-2.png'),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       right: 40,
//                       top: 40,
//                       width: 80,
//                       height: 150,
//                       child: FadeInUp(
//                         duration: Duration(milliseconds: 1300),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage('assets/clock.png'),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       child: FadeInUp(
//                         duration: Duration(milliseconds: 1600),
//                         child: Container(
//                           margin: EdgeInsets.only(top: 50),
//                           child: Center(
//                             child: Text(
//                               "Login",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(30.0),
//                 child: Column(
//                   children: <Widget>[
//                     FadeInUp(
//                       duration: Duration(milliseconds: 1800),
//                       child: Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                             color: Color.fromRGBO(143, 148, 251, 1),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromRGBO(143, 148, 251, .2),
//                               blurRadius: 20.0,
//                               offset: Offset(0, 10),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               decoration: BoxDecoration(
//                                 border: Border(
//                                   bottom: BorderSide(
//                                     color: Color.fromRGBO(143, 148, 251, 1),
//                                   ),
//                                 ),
//                               ),
//                               child: TextField(
//                                 controller: _usernameController,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: "Email",
//                                   hintStyle: TextStyle(color: Colors.grey[700]),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextField(
//                                 controller: _passwordController,
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: "Password",
//                                   hintStyle: TextStyle(color: Colors.grey[700]),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     FadeInUp(
//                       duration: Duration(milliseconds: 1900),
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromRGBO(143, 148, 251, 1),
//                               Color.fromRGBO(143, 148, 251, .6),
//                             ],
//                           ),
//                         ),
//                         child: Center(
//                           child: TextButton(
//                             onPressed: () {
//                               loginApi(
//                                 username: _usernameController.text,
//                                 password: _passwordController.text,
//                                 context: context,
//                               );
//                             },
//                             child: Text(
//                               "Login",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                       FadeInUp(
//                       duration: Duration(milliseconds: 2000),
//                       child: InkWell(onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => FakeProductRegisterScreen(),));
//                       },
//                         child: Text(
//                           "Register",
//                           style: TextStyle(
//                             color: Color.fromRGBO(143, 148, 251, 1),
//                           ),
//                         ),
//                       ),
//                     ),SizedBox(height: 30),
//                     FadeInUp(
//                       duration: Duration(milliseconds: 2000),
//                       child: InkWell(onTap: (){
//                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen(),));

//                       },
//                         child: Text(
//                           "Forgot Password?",
//                           style: TextStyle(
//                             color: Color.fromRGBO(143, 148, 251, 1),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:skin/screns/forgot.dart';
import 'package:skin/screns/register.dart';
import 'package:skin/services/loginApi.dart';

class lo extends StatefulWidget {
  @override
  State<lo> createState() => _loState();
}

class _loState extends State<lo> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;  // To control password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeInUp(
                        duration: Duration(seconds: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/light-1.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1200),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/light-2.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/clock.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(143, 148, 251, 1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: !isPasswordVisible, // Toggle visibility
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey[700]),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey[700],
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    FadeInUp(
                      duration: Duration(milliseconds: 1900),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ],
                          ),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              loginApi(
                                username: _usernameController.text,
                                password: _passwordController.text,
                                context: context,
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FakeProductRegisterScreen(),),
                          );
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Color.fromRGBO(143, 148, 251, 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPasswordScreen(),),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color.fromRGBO(143, 148, 251, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
