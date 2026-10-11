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
