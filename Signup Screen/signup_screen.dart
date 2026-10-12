import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  // ============================================================
  // ECO WISE COLORS
  // ============================================================

  static const Color primaryGreen = Color(0xFF0B302A);
  static const Color primaryYellow = Color(0xFFFFB333);
  static const Color backgroundColor = Color(0xFFEEEEEE);
  static const Color unselectedColor = Color(0xFFD9D9D9);

 // ============================================================
  // SIGNUP STATE
  // ============================================================

  int currentStep = 0;

  // Only one account type can be selected.
  String? selectedRole;

  final _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isSubmitting = false;

  // ============================================================
  // TEXT CONTROLLERS
  // ============================================================

  final usernameController = TextEditingController();
  final addressController = TextEditingController();
  final nicController = TextEditingController();
  final serviceIdController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    addressController.dispose();
    nicController.dispose();
    serviceIdController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // ============================================================
  // SELECT ACCOUNT TYPE
  // ============================================================

  void selectRole(String role) {
    setState(() {
      selectedRole = role;
    });
  }

 // ============================================================
  // NEXT BUTTON
  // ============================================================

  void goToForm() {
    if (selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select Resident or Truck Driver.'),
          backgroundColor: primaryGreen,
        ),
      );
      return;
    }

    setState(() {
      currentStep = 1;
    });
  }

 // ============================================================
  // SUBMIT SIGNUP FORM
  // ============================================================

  Future<void> submitSignup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    setState(() {
      isSubmitting = true;
    });

    // This delay is only a demonstration of a loading state.
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    setState(() {
      isSubmitting = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${selectedRole!} form completed successfully!',
        ),
        backgroundColor: primaryGreen,
      ),
    );

    // Navigate to the login screen after successful registration.
  }

  // ============================================================
  // MAIN UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 20,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: currentStep == 0
                    ? _buildRoleSelection()
                    : _buildSignupForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ECO WISE LOGO
  // ============================================================

  Widget _buildLogo({double fontSize = 38}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ==================================================
        // LOGO
        // ==================================================

        const SizedBox(height: 62),

        Image.asset(

          'assets/images/eco_wise_logo.png',

          width: 265,

          height: 175,

          fit: BoxFit.contain,

          errorBuilder: (

            context,

            error,

            stackTrace,

          ) {

            return RichText(

              text: const TextSpan(

                children: [

                  TextSpan(

                    text: 'ECO ',

                    style: TextStyle(

                      color: Color(0xFFFFB333),

                      fontSize: 30,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  TextSpan(

                    text: 'WISE',

                    style: TextStyle(

                      color: Color(0xFF073D36),

                      fontSize: 30,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ],

              ),

            );

          },

        ),
      ],
    );
  }

  // ============================================================
  // STEP 1: RESIDENT / TRUCK DRIVER SELECTION
  // ============================================================

  Widget _buildRoleSelection() {
    return Container(
      key: const ValueKey('roleSelection'),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 36,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),

          _buildLogo(fontSize: 36),

          const SizedBox(height: 45),

          const Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 55),

          // RESIDENT OPTION
          _buildRoleButton(
            title: 'Resident',
            icon: Icons.person_outline,
            role: 'Resident',
          ),

          const SizedBox(height: 20),

          // TRUCK DRIVER OPTION
          _buildRoleButton(
            title: 'Truck Driver',
            icon: Icons.local_shipping_outlined,
            role: 'Truck Driver',
          ),

          const SizedBox(height: 55),

          // NEXT BUTTON
          _buildPrimaryButton(
            title: 'Next',
            onPressed: goToForm,
          ),

          const SizedBox(height: 25),

          _buildLoginText(),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // ============================================================
  // ROLE SELECTION BUTTON
  // ============================================================

  Widget _buildRoleButton({
    required String title,
    required IconData icon,
    required String role,
  }) {
    final bool isSelected = selectedRole == role;

    return InkWell(
      onTap: () => selectRole(role),
      borderRadius: BorderRadius.circular(15),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: isSelected ? primaryYellow : unselectedColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? primaryGreen : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 23,
              color: isSelected ? primaryGreen : Colors.black,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? primaryGreen : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 10),
              const Icon(
                Icons.check_circle,
                color: primaryGreen,
                size: 20,
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ============================================================
  // STEP 2: RESIDENT / TRUCK DRIVER FORM
  // ============================================================

  Widget _buildSignupForm() {
    final bool isResident = selectedRole == 'Resident';

    return Container(
      key: ValueKey('signupForm_$selectedRole'),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 28,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: _buildLogo(fontSize: 34),
            ),

            const SizedBox(height: 32),

                Text(
              isResident ? 'Resident Sign Up' : 'Truck Driver Sign Up',
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: primaryGreen,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Please Fill this Form',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 22),

            // USERNAME
            _buildTextField(
              controller: usernameController,
              hint: 'Username',
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your username';
                }
                if (value.trim().length < 3) {
                  return 'Username must contain at least 3 characters';
                }
                return null;
              },
            ),

            // RESIDENT ADDRESS
            if (isResident) ...[
              const SizedBox(height: 17),
              _buildTextField(
                controller: addressController,
                hint: 'Address',
                icon: Icons.location_on_outlined,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
            ],

            // NIC NUMBER
            const SizedBox(height: 17),
            _buildTextField(
              controller: nicController,
              hint: 'NIC Number',
              icon: Icons.badge_outlined,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your NIC number';
                }

                final nic = value.trim().toUpperCase();
                final validNic = RegExp(
                  r'^(?:[0-9]{9}[VX]|[0-9]{12})$',
                ).hasMatch(nic);

                if (!validNic) {
                  return 'Enter a valid NIC number';
                }

                return null;
              },
            ),

            // TRUCK DRIVER SERVICE ID
            if (!isResident) ...[
              const SizedBox(height: 17),
              _buildTextField(
                controller: serviceIdController,
                hint: 'Service Identity Number',
                icon: Icons.assignment_ind_outlined,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your service identity number';
                  }
                  return null;
                },
              ),
            ],

            // MOBILE NUMBER
            const SizedBox(height: 17),
            _buildTextField(
              controller: mobileController,
              hint: 'Mobile Number',
              icon: Icons.phone_android_outlined,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your mobile number';
                }

                final mobile = value.replaceAll(
                  RegExp(r'[\s+-]'),
                  '',
                );

                // Accepts Sri Lankan 07XXXXXXXX or 947XXXXXXXX.
                if (!RegExp(r'^(?:07[0-9]{8}|947[0-9]{8})$')
                    .hasMatch(mobile)) {
                  return 'Enter a valid mobile number';
                }

                return null;
              },
            ),

            // PASSWORD
            const SizedBox(height: 17),
            _buildTextField(
              controller: passwordController,
              hint: 'Password',
              icon: Icons.lock_outline,
              obscureText: obscurePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                icon: Icon(
                  obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 6) {
                  return 'Password must contain at least 6 characters';
                }
                return null;
              },
            ),

            // CONFIRM PASSWORD
            const SizedBox(height: 17),
            _buildTextField(
              controller: confirmPasswordController,
              hint: 'Confirm Password',
              icon: Icons.lock_reset_outlined,
              obscureText: obscureConfirmPassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureConfirmPassword =
                        !obscureConfirmPassword;
                  });
                },
                icon: Icon(
                  obscureConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }

                if (value != passwordController.text) {
                  return 'Passwords do not match';
                }

                return null;
              },
            ),

            const SizedBox(height: 28),

            // SUBMIT BUTTON
            _buildPrimaryButton(
              title: isSubmitting ? 'Please wait...' : 'Submit',
              isLoading: isSubmitting,
              onPressed: isSubmitting ? null : submitSignup,
            ),

            const SizedBox(height: 22),

            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    currentStep = 0;
                  });
                },
                child: const Text(
                  'Change Account Type',
                  style: TextStyle(
                    color: primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            _buildLoginText(),
          ],
        )
      )
    )
  }

  // ============================================================
  // REUSABLE INPUT FIELD
  // ============================================================

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          icon,
          color: primaryGreen,
          size: 21,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: primaryGreen,
            width: 1.8,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: primaryGreen,
            width: 1.8,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: primaryYellow,
            width: 2.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PRIMARY BUTTON
  // ============================================================

  Widget _buildPrimaryButton({
    required String title,
    required VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 51,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: primaryYellow,
          disabledBackgroundColor: primaryGreen.withValues(alpha: 0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 23,
                height: 23,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: primaryYellow,
                ),
              )
            : Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
      ),
    );
  }

  // ============================================================
  // LOGIN LINK
  // ============================================================

  Widget _buildLoginText() {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text(
            'Already have an Account? ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

}