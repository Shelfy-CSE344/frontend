import 'package:flutter/material.dart';
import 'package:shelfy/main.dart';
import 'main_navigation.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFA7EDE7), Color(0xFFE0F7F4)],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Icon(Icons.menu_book_rounded, size: 80, color: Colors.black87),
                  SizedBox(height: 20),
                  Text('Welcome!',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  Text('Welcome Book Lover!', style: TextStyle(fontSize: 16)),
                  Text('Shelfy',
                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                  SizedBox(height: 30),
                  buildTextField('Enter your email', emailController),
                  SizedBox(height: 15),
                  buildTextField('Enter your password', passwordController, isPassword: true),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Forgot password logic
                      },
                      child: Text("Forget Your Password?",
                          style: TextStyle(color: Colors.blueAccent, fontSize: 13)),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 55),
                      backgroundColor: Color(0xFF5BC8B8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigation()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: Text('LOG IN',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  SizedBox(height: 25),
                  Divider(thickness: 1),
                  SizedBox(height: 10),
                  Text("Don’t have an account?", style: TextStyle(color: Colors.grey[700])),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      ); // Geri dön
                    },
                    child: Text("SIGN UP",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, TextEditingController controller, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
