// lib/screens/overview_screen.dart
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Financial Overview', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Interactive Onboarding Guide for New Users
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.teal.shade100),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: Colors.teal.shade700, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to your Workspace!',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal.shade900, fontSize: 15),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'This dashboard tracks live balances, inflows, and expense classifications synchronized with your system accounts.',
                            style: TextStyle(color: Colors.teal.shade800, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 2. The Net Worth Summary Card (EGP-focused layout)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade800, Colors.teal.shade900],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.shade900.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'TOTAL NET BALANCE',
                      style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1.5),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '45,250.00 EGP',
                      style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        // Income Block
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.white.withOpacity(0.15),
                                child: const Icon(Icons.arrow_downward, color: Colors.greenAccent, size: 16),
                              ),
                              const SizedBox(width: 8),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Income', style: TextStyle(color: Colors.white60, fontSize: 12)),
                                  Text('60,000 EGP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Divider Line
                        Container(width: 1, height: 32, color: Colors.white24),
                        const SizedBox(width: 16),
                        // Expense Block
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.white.withOpacity(0.15),
                                child: const Icon(Icons.arrow_upward, color: Colors.redAccent, size: 16),
                              ),
                              const SizedBox(width: 8),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Expenses', style: TextStyle(color: Colors.white60, fontSize: 12)),
                                  Text('14,750 EGP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // 3. Ledger Segment Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent General Ledger', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                  Text('View All', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 12),

              // 4. Ledger Stream Activity (5 Primary Core Categories)
              _buildTransactionItem(
                title: 'Monthly Resource Retainer',
                subtitle: 'Inbound Bank Wire Transfer',
                amount: '+60,000.00 EGP',
                category: 'Salary',
                icon: Icons.monetization_on,
                iconColor: Colors.green,
              ),
              _buildTransactionItem(
                title: 'Hypermarket Supply Restock',
                subtitle: 'Point of Sale Transaction',
                amount: '-4,200.00 EGP',
                category: 'Groceries',
                icon: Icons.shopping_cart,
                iconColor: Colors.orange,
              ),
              _buildTransactionItem(
                title: 'Corporate Office Allocation',
                subtitle: 'Automated Standing Order',
                amount: '-8,500.00 EGP',
                category: 'Rent',
                icon: Icons.home,
                iconColor: Colors.blue,
              ),
              _buildTransactionItem(
                title: 'SaaS Toolchain Renewal',
                subtitle: 'Online Debit Authorization',
                amount: '-1,150.00 EGP',
                category: 'Subscriptions',
                icon: Icons.credit_card,
                iconColor: Colors.purple,
              ),
              _buildTransactionItem(
                title: 'Team Luncheon Expense',
                subtitle: 'Commercial Dining Charge',
                amount: '-900.00 EGP',
                category: 'Dining Out',
                icon: Icons.restaurant,
                iconColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A reusable internal building block for ledger items
  Widget _buildTransactionItem({
    required String title,
    required String subtitle,
    required String amount,
    required String category,
    required IconData icon,
    required Color iconColor,
  }) {
    final isIncome = amount.startsWith('+');

    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade100),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(6)),
              child: Text(category, style: TextStyle(fontSize: 10, color: Colors.grey.shade700, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        trailing: Text(
          amount,
          style: TextStyle(
            color: isIncome ? Colors.green.shade700 : Colors.red.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}