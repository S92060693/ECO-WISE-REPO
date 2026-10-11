import 'dart:math';
import 'package:flutter/material.dart';

import 'resident_dashboard_screen.dart';
import 'truck_driver_dashboard_screen.dart';
import 'admin_dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();
 // ============================================================
  // VARIABLES
  // ============================================================

  bool obscurePassword = true;

  bool isLoading = false;

  // ============================================================
  // LOADING ANIMATION CONTROLLER
  // ============================================================

  late AnimationController loadingController;

  // ============================================================
  // INIT STATE
  // ============================================================

  @override
  void initState() {
    super.initState();

    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    loadingController.dispose();

    super.dispose();
  }

  // ============================================================
  // LOGIN
  // ============================================================

  Future<void> login() async {
    // Prevent multiple clicks
    if (isLoading) {
      return;
    }

    final String username = usernameController.text.trim();
    final String password = passwordController.text.trim();

    // Empty validation
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username and password'),
        ),
      );
      return;
    }

    // Select dashboard based on login details
    Widget? dashboard;

    if (username == 'resident' && password == '1234') {
      dashboard = const DashboardScreen();
    } else if (username == 'truck' && password == '1234') {
      dashboard = const TruckDriverDashboardScreen();
    } else if (username == 'admin' && password == '1234') {
      dashboard = const AdminDashboardScreen();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
        ),
      );
      return;
    }

    // Start loading
    setState(() {
      isLoading = true;
    });

    loadingController.repeat();

    // Keep your existing 5-second loading time
    await Future.delayed(const Duration(seconds: 5));

    if (!mounted) {
      return;
    }

    // Stop loading
    loadingController.stop();

    // Navigate to the selected dashboard
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (context) => dashboard!,
      ),
    );
  }

  // ============================================================
  // FORGOT PASSWORD
  // ============================================================

  void forgotPassword() {
    if (isLoading) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Forgot Password selected',
        ),
      ),
    );
  }