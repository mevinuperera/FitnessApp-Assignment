import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'gender.dart';

void main() {
  runApp(const SignupPage());
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signup Page',
      theme: ThemeData(
        fontFamily: 'Popover',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB09489)),
      ),
      home: const SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 89),
            const Text('Create Account!',
                style: TextStyle(fontSize: 24, color: Colors.black)),
            const SizedBox(height: 4),
            const Text('Signup and start the journey',
                style: TextStyle(fontSize: 15, color: Color(0xFF909090))),
            const SizedBox(height: 38),
            _buildInputField(label: 'Full Name', controller: _fullNameController),
            const SizedBox(height: 27),
            _buildInputField(
                label: 'Email address',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 27),
            _buildInputField(
              label: 'Password',
              controller: _passwordController,
              isPassword: true,
              obscureText: _obscureText,
              onToggleVisibility: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Validate input fields
                  String fullName = _fullNameController.text.trim();
                  String email = _emailController.text.trim();
                  String password = _passwordController.text.trim();

                  if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a valid email address'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (password.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password must be at least 6 characters long'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // If all validations pass, proceed to GenderScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenderScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB09489),
                  minimumSize: const Size(304, 62),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('SIGN UP',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
            const SizedBox(height: 32),
            const Divider(color: Color(0xFF909090)),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSocialButton('GOOGLE', 'assets/icons/google.png', () {}),
                _buildSocialButton('Facebook', 'assets/icons/facebook.png', () {}),
              ],
            ),
            const SizedBox(height: 45),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 13),
                  children: [
                    const TextSpan(
                      text: 'Already Have An Account? ',
                      style: TextStyle(color: Color(0xFF909090)),
                    ),
                    TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        color: Color(0xFFB09489),
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
    bool? obscureText,
    VoidCallback? onToggleVisibility,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? (obscureText ?? true) : false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFFB09489)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ?? true ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF909090),
                ),
                onPressed: onToggleVisibility,
              )
            : null,
      ),
    );
  }

  Widget _buildSocialButton(String text, String iconPath, VoidCallback onPressed) {
    return SizedBox(
      width: 168,
      height: 72,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(color: Color(0x80909090)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 24, height: 24),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}