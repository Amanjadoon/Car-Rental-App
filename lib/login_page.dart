import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function(String email) onLoginSuccess;

  const LoginPage({super.key, required this.onLoginSuccess});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  bool _isLoading = false;
  bool _isSignUp = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  final Map<String, String> _demoUsers = {
    'admin@gmail.com': '123456',
    'user@gmail.com': 'password',
  };

  void _submit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnack('Please fill all fields', Colors.red);
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    if (_isSignUp) {
      _showSnack('Account created successfully', Colors.green);
      widget.onLoginSuccess(email);
      Navigator.pop(context);
    } else {
      if (_demoUsers.containsKey(email) &&
          _demoUsers[email] == password) {
        _showSnack('Welcome back!', Colors.green);
        widget.onLoginSuccess(email);
        Navigator.pop(context);
      } else {
        _showSnack('Invalid email or password', Colors.red);
      }
    }
  }

  void _showSnack(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        elevation: 0,
        title: Text(
          _isSignUp ? "Create Account" : "Login",
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1E3C72),
                Color(0xff2A5298),
              ],
            ),
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 380,
            margin: const EdgeInsets.all(20),

            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                )
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Container(
                  height: 90,
                  width: 90,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff1E3C72),
                        Color(0xff2A5298),
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 15,
                      )
                    ],
                  ),

                  child: const Icon(
                    Icons.directions_car_filled,
                    size: 45,
                    color: Colors.white,
                  ),
                ),


                const SizedBox(height: 20),


                Text(
                  _isSignUp
                      ? "Create Your Account"
                      : "Welcome Back!",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1E3C72),
                  ),
                ),


                const SizedBox(height: 8),


                Text(
                  _isSignUp
                      ? "Register to book your favorite cars"
                      : "Login to manage your bookings",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),


                const SizedBox(height: 30),


                if (_isSignUp) ...[
                  _field(
                    _nameController,
                    "Full Name",
                    Icons.person_outline,
                  ),

                  const SizedBox(height: 15),
                ],


                _field(
                  _emailController,
                  "Email Address",
                  Icons.email_outlined,
                ),


                const SizedBox(height: 15),
                                TextField(
                  controller: _passwordController,
                  obscureText: _isHidden,

                  decoration: InputDecoration(

                    labelText: "Password",

                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xff1E3C72),
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _isHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),

                      onPressed: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),

                    filled: true,
                    fillColor: const Color(0xffF8F9FC),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: const BorderSide(
                        color: Color(0xff1E3C72),
                        width: 2,
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 20),


                if (!_isSignUp)
                  Align(
                    alignment: Alignment.centerRight,

                    child: TextButton(
                      onPressed: () {
                        _showSnack(
                          "Demo: admin@gmail.com / 123456",
                          const Color(0xff1E3C72),
                        );
                      },

                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xff1E3C72),
                        ),
                      ),
                    ),
                  ),


                const SizedBox(height: 15),


                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(

                    onPressed:
                        _isLoading ? null : _submit,

                    style: ElevatedButton.styleFrom(

                      elevation: 5,

                      backgroundColor:
                          const Color(0xff1E3C72),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),


                    child: _isLoading

                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )

                        : Text(

                            _isSignUp
                                ? "CREATE ACCOUNT"
                                : "LOGIN",

                            style: const TextStyle(

                              color: Colors.white,

                              fontSize: 16,

                              fontWeight:
                                  FontWeight.bold,

                              letterSpacing: 1,
                            ),
                          ),
                  ),
                ),


                const SizedBox(height: 20),


                GestureDetector(

                  onTap: () {

                    setState(() {

                      _isSignUp = !_isSignUp;

                      _emailController.clear();

                      _passwordController.clear();

                      _nameController.clear();

                    });
                  },


                  child: RichText(

                    text: TextSpan(

                      children: [

                        TextSpan(

                          text: _isSignUp
                              ? "Already have account? "
                              : "Don't have account? ",

                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),


                        TextSpan(

                          text: _isSignUp
                              ? "LOGIN"
                              : "SIGN UP",

                          style: const TextStyle(

                            color:
                                Color(0xff1E3C72),

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
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


  Widget _field(
      TextEditingController controller,
      String label,
      IconData icon,
      ) {

    return TextField(

      controller: controller,

      decoration: InputDecoration(

        labelText: label,

        prefixIcon: Icon(
          icon,
          color: Color(0xff1E3C72),
        ),

        filled: true,

        fillColor:
            const Color(0xffF8F9FC),


        border: OutlineInputBorder(

          borderRadius:
              BorderRadius.circular(15),

          borderSide: BorderSide.none,
        ),


        focusedBorder:
            OutlineInputBorder(

          borderRadius:
              BorderRadius.circular(15),

          borderSide:
              const BorderSide(

            color:
                Color(0xff1E3C72),

            width: 2,
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {

    _emailController.dispose();

    _passwordController.dispose();

    _nameController.dispose();

    super.dispose();
  }
}