
import 'package:flutter/material.dart';

class TruckDriverDashboard extends StatelessWidget {
  const TruckDriverDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text(
          'Truck Driver Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF003366),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Driver!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003366),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage your deliveries and truck activities.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),

            _dashboardCard(
              icon: Icons.local_shipping,
              title: 'My Deliveries',
              subtitle: 'View your assigned deliveries',
              color: Colors.blue,
              onTap: () {},
            ),
            _dashboardCard(
              icon: Icons.route,
              title: 'My Routes',
              subtitle: 'Check your delivery routes',
              color: Colors.green,
              onTap: () {},
            ),
            _dashboardCard(
              icon: Icons.assignment,
              title: 'Delivery History',
              subtitle: 'View completed deliveries',
              color: Colors.orange,
              onTap: () {},
            ),
            _dashboardCard(
              icon: Icons.person,
              title: 'My Profile',
              subtitle: 'View your driver information',
              color: Colors.purple,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: color.withValues(alpha: 0.12),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
