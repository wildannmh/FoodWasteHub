import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false; // State untuk checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          // Gunakan constraint minHeight agar background tetap full screen
          height: MediaQuery.of(context).size.height > 700
              ? MediaQuery.of(context).size.height
              : null,
          child: Stack(
            children: [
              // Dekorasi Atas
              Positioned(
                top: -50,
                left: -50,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB9F6CA).withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Welcome to',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const Text(
                      'FoodWaste Hub',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF424242),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'How you manage your waste?\nIf not, then start from now.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 30),

                    // Form Fields
                    _buildTextField('Name'),
                    const SizedBox(height: 15),
                    _buildTextField('Email'),
                    const SizedBox(height: 15),
                    _buildTextField('Password', obscureText: true),
                    const SizedBox(height: 15),
                    _buildTextField('Confirm Password', obscureText: true),
                    const SizedBox(height: 15),

                    // Terms & Conditions Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: Colors.green,
                          onChanged: (val) {
                            setState(() {
                              isChecked = val!;
                            });
                          },
                        ),
                        const Text("I accept the terms & conditions"),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika Register
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Kembali ke Login
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50), // Spacer bawah
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper untuk membuat TextField agar kode lebih rapi
  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
      ),
    );
  }
}
