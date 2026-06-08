// lib/screens/landing_screen.dart
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/overview.dart'; // Verified matching your import path

class LandingScreen extends StatelessWidget {
  final String userName;

  // Constructor passing authenticated user identification
  const LandingScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    // --- MOCK BACKEND DATA LOOKUPS ---
    // These mock fields match your multi-tab registration updates
    final String mockMobile = "+20 100 123 4567";
    final String mockGender = "Male";
    final String mockBirthdate = "1995-08-24";
    final String mockJoinedDate = "June 2026";

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      
      // 1. App Bar with Menu Trigger Anchor
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
        title: const Text('User Dashboard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),

      // 2. Global Navigation Drawer Component
      drawer: _buildNavigationDrawer(context),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Identity Header Segment
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.teal.shade200, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.teal,
                        child: Text(
                          userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
                          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome back, $userName!',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Member since $mockJoinedDate',
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Account Metrics Title
              const Text(
                'Personal Profile Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 16),

              // Grid Wrapper for Mock Data Metrics Cards
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Disables inner scrolling conflict
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.4,
                children: [
                  _buildMetricCard('Mobile Phone', mockMobile, Icons.phone_android_outlined, Colors.blue),
                  _buildMetricCard('Gender Ident', mockGender, Icons.wc_outlined, Colors.purple),
                  _buildMetricCard('Date of Birth', mockBirthdate, Icons.calendar_month_outlined, Colors.orange),
                  _buildMetricCard('Cloud Sync', 'Active', Icons.cloud_done_outlined, Colors.green),
                ],
              ),
              const SizedBox(height: 32),

              // Action Link Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OverviewScreen()),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Go to Ledger Overview', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper builder function to generate clean metric layout components
  Widget _buildMetricCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade100, blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 12, color: Colors.grey.shade500, fontWeight: FontWeight.w500)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
            ],
          )
        ],
      ),
    );
  }

  // 3. Central Application Menu Drawer Constructor
  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.teal),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
            ),
            accountName: Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: const Text('Synchronized Session Active'),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard_outlined, color: Colors.teal),
            title: const Text('Profile Dashboard', style: TextStyle(fontWeight: FontWeight.w600)),
            selected: true,
            selectedTileColor: Colors.teal.shade50,
            selectedColor: Colors.teal,
            onTap: () => Navigator.pop(context), // Closes the drawer menu safely
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text('Ledger Overview'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OverviewScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics_outlined),
            title: const Text('Expenses Analytics'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Wire path to your future charts screen
            },
          ),
          const Divider(), // Structural splitter line
          const Spacer(), // Pushes logout action link to the bottom edge
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
            title: const Text('Sign Out', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600)),
            onTap: () {
              // Wipes routing paths entirely and bounces them back to parent landing tier
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}