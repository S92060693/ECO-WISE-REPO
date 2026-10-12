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



}