import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // Daftar halaman yang bisa di-switch
  final List<Widget> _pages = [
Container(
  margin: const EdgeInsets.all(16),
  padding: const EdgeInsets.all(20),
  height: 100,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.blue.shade50,
        Colors.white,
        Colors.purple.shade50,
      ],
    ),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.blue.withOpacity(0.2),
        blurRadius: 15,
        offset: const Offset(0, 8),
        spreadRadius: 2,
      ),
      BoxShadow(
        color: Colors.purple.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(-5, -5),
      ),
    ],
    border: Border.all(
      color: Colors.white.withOpacity(0.5),
      width: 1.5,
    ),
  ),
  
  child: Row(
    children: [
      // Avatar dengan gradient - flex 3
      Expanded(
        flex: 3,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      ),
      
      // Informasi user - flex 6 (TENGAH)
      Expanded(
        flex: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'john_doe',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blue.shade200,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.admin_panel_settings_rounded,
                    size: 14,
                    color: Colors.blue.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Administrator',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Icon settings - flex 3
      Expanded(
        flex: 3,
        child: Container(
          alignment: Alignment.centerRight,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.grey.shade700,
                size: 22,
              ),
              onPressed: () {
                // Aksi settings
              },
            ),
          ),
        ),
      ),
    ],
  ),
),
    const Center(child: Text("Products Page", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Cart Page", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POS Dashboard"),
      ),
      body: _pages[_currentIndex], // Tampilkan halaman sesuai index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update halaman
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DashboardPage(),
    debugShowCheckedModeBanner: false,
  ));
}