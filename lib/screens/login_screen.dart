import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'register_screen.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan password harus diisi')),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            width: 430,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.music_note,
                  color: AppColors.primary,
                  size: 55,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Spotify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Log in to Spotify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email or username'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email or username',
                    filled: true,
                    fillColor: Color(0xFF242424),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: const Color(0xFF242424),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                const Divider(color: Colors.grey),
                const SizedBox(height: 15),

                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: AppColors.textSecondary),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign up for Spotify',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
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