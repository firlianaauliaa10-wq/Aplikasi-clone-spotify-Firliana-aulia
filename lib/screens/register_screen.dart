import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'dashboard_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void register() {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua kolom harus diisi')),
      );
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
      ),
      (route) => false,
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
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Create your account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    filled: true,
                    fillColor: Color(0xFF242424),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Color(0xFF242424),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Color(0xFF242424),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Already have an account? Log in',
                    style: TextStyle(color: Colors.white),
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