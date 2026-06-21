import 'package:flutter/material.dart';
import 'ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // TOP BAR (UI ONLY HOME BUTTON)
      appBar: AppBar(
        backgroundColor: const Color(0xff1E3C72),
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),

        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {}, // ❌ NO NAVIGATION (UI ONLY)
        ),
      ),

      backgroundColor: const Color(0xffF5F7FA),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ],
            ),

            child: Column(
              children: [

                const Icon(
                  Icons.directions_car,
                  size: 70,
                  color: Color.fromARGB(255, 255, 38, 0),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                // EMAIL
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // PASSWORD
                TextField(
                  obscureText: isHidden,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // LOGIN BUTTON (UI ONLY)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {}, // ❌ NO NAVIGATION
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(221, 255, 8, 0),
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // SIGNUP BUTTON (UI ONLY)
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {}, // ❌ NO NAVIGATION
                    child: const Text(
                      "Don't have an account? SIGN UP",
                      style: TextStyle(
                        color: Color.fromARGB(246, 255, 0, 0),
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