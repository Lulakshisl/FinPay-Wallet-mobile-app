import 'package:flutter/material.dart';
import '../../transactions/screens/send_payment_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildBalanceCard(),
              _buildQuickActions(context),
              _buildTransactionList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF6C63FF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Good Morning 👋',
                  style: TextStyle(color: Colors.white70, fontSize: 13)),
              const Text('Lulakshi',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined,
                    color: Colors.white),
                onPressed: () {},
              ),
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.3),
                child: const Text('L',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF3B1FE8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Balance',
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
              Icon(Icons.more_horiz, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 8),
          const Text('LKR 124,500.00',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCardStat(Icons.arrow_downward, 'Income', 'LKR 45,000'),
              _buildCardStat(Icons.arrow_upward, 'Expenses', 'LKR 12,300'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardStat(IconData icon, String label, String amount) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    color: Colors.white70, fontSize: 12)),
            Text(amount,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAction(context, Icons.send, 'Send'),
          _buildAction(context, Icons.download, 'Receive'),
          _buildAction(context, Icons.swap_horiz, 'Transfer'),
          _buildAction(context, Icons.more_horiz, 'More'),
        ],
      ),
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'Send') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SendPaymentScreen(),
            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF6C63FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF6C63FF)),
          ),
          const SizedBox(height: 6),
          Text(label,
              style:
                  const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    final transactions = [
      {'icon': Icons.shopping_bag, 'title': 'Shopping', 'sub': 'Today 2:30 PM', 'amount': '-LKR 3,200', 'color': Colors.orange, 'isDebit': true},
      {'icon': Icons.work, 'title': 'Salary', 'sub': 'Yesterday', 'amount': '+LKR 45,000', 'color': Colors.green, 'isDebit': false},
      {'icon': Icons.restaurant, 'title': 'Restaurant', 'sub': 'Jun 5, 7:00 PM', 'amount': '-LKR 1,800', 'color': Colors.red, 'isDebit': true},
      {'icon': Icons.electric_bolt, 'title': 'Electricity Bill', 'sub': 'Jun 4, 10:00 AM', 'amount': '-LKR 2,500', 'color': Colors.blue, 'isDebit': true},
      {'icon': Icons.phone_android, 'title': 'Mobile Recharge', 'sub': 'Jun 3, 9:00 AM', 'amount': '-LKR 500', 'color': Colors.purple, 'isDebit': true},
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Transactions',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                  onPressed: () {},
                  child: const Text('See All',
                      style: TextStyle(color: Color(0xFF6C63FF)))),
            ],
          ),
          const SizedBox(height: 8),
          ...transactions.map((t) => _buildTransactionItem(t)),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> t) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: (t['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(t['icon'] as IconData,
                color: t['color'] as Color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t['title'] as String,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15)),
                Text(t['sub'] as String,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(
            t['amount'] as String,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: (t['isDebit'] as bool) ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      selectedItemColor: const Color(0xFF6C63FF),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz), label: 'Transfer'),
        BottomNavigationBarItem(
            icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
