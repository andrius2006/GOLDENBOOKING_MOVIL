import 'package:flutter/material.dart';

// --- GOLDENBOOKING SPORTS MOBILE MODULE (AURA PREMIUM THEME) ---
// This code reproduces the "Módulo de Deportes Mobile - Fusionado" screen.

void main() {
  runApp(const MaterialApp ());
}

class Home extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOLDENBOOKING',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
          primary: const Color(0xFFD4AF37),
          surface: const Color(0xFF121415),
          brightness: Brightness.dark,
        ),
      ),
      home: const SportsMobileScreen(),
    );
  }
}

class SportsMobileScreen extends StatefulWidget {
  const SportsMobileScreen({super.key});

  @override
  State<SportsMobileScreen> createState() => _SportsMobileScreenState();
}

class _SportsMobileScreenState extends State<SportsMobileScreen> {
  String _selectedCategory = "Tennis";
  int _selectedDayIndex = 2; // Wednesday 15
  String? _selectedTime = "11:00 AM";

  final List<Map<String, dynamic>> _categories = [
    {"name": "Fútbol", "icon": Icons.sports_soccer},
    {"name": "Básquet", "icon": Icons.sports_basketball},
    {"name": "Tennis", "icon": Icons.sports_tennis},
    {"name": "Pádel", "icon": Icons.sports_baseball}, // Custom icon representation
  ];

  final List<Map<String, String>> _days = [
    {"day": "LUN", "num": "13"},
    {"day": "MAR", "num": "14"},
    {"day": "MIE", "num": "15"},
    {"day": "JUE", "num": "16"},
    {"day": "VIE", "num": "17"},
    {"day": "SAB", "num": "18"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121415),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'GOLDENBOOKING',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(''),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner
            _buildHeroBanner(),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categorías", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("VER TODO", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Categories list
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  return _buildCategoryItem(cat['name'], cat['icon']);
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 32, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Seleccionar Fecha", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("Mayo 2024", style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),

            // Date Selector
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _days.length,
                itemBuilder: (context, index) {
                  return _buildDateItem(index);
                },
              ),
            ),

            // Time Slots Section
            _buildTimeSlotsSection(),

            // Reservation Summary Card
            _buildSummaryCard(),

            const SizedBox(height: 100), // Space for FAB-like button
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4AF37),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 8,
              shadowColor: const Color(0xFFD4AF37).withOpacity(0.4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("RESERVAR AHORA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    height: 200,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo
          Image.asset(
            "assets/aaaa.jpg",
            fit: BoxFit.cover,
          ),

          // Degradado oscuro
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),

          // Texto
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4AF37).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "EXPERIENCIA PREMIUM",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "CLUB VALLE DORADO",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Descubre reservas de espacios deportivos, hotelería y más.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildCategoryItem(String name, IconData icon) {
    bool isSelected = _selectedCategory == name;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = name),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFD4AF37) : const Color(0xFF1A1C1D),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isSelected ? const Color(0xFFD4AF37) : Colors.white10),
                boxShadow: isSelected ? [BoxShadow(color: const Color(0xFFD4AF37).withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))] : null,
              ),
              child: Icon(icon, color: isSelected ? Colors.black : const Color(0xFFD4AF37)),
            ),
            const SizedBox(height: 8),
            Text(name, style: TextStyle(fontSize: 12, color: isSelected ? const Color(0xFFD4AF37) : Colors.grey, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }

  Widget _buildDateItem(int index) {
    bool isSelected = _selectedDayIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedDayIndex = index),
      child: Container(
        width: 65,
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD4AF37) : const Color(0xFF1A1C1D),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: isSelected ? const Color(0xFFD4AF37) : Colors.white10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_days[index]['day']!, style: TextStyle(fontSize: 10, color: isSelected ? Colors.black : Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(_days[index]['num']!, style: TextStyle(fontSize: 18, color: isSelected ? Colors.black : Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlotsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimeGroup("MAÑANA", Icons.light_mode, ["08:00 AM", "09:30 AM", "11:00 AM"], [true, false, false]),
          const SizedBox(height: 24),
          _buildTimeGroup("TARDE", Icons.sunny, ["12:30 PM", "02:00 PM", "03:30 PM"], [false, false, true]),
        ],
      ),
    );
  }

  Widget _buildTimeGroup(String title, IconData icon, List<String> times, List<bool> booked) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: Colors.grey),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: times.asMap().entries.map((entry) {
            int idx = entry.key;
            String time = entry.value;
            bool isBooked = booked[idx];
            bool isSelected = _selectedTime == time;

            return Expanded(
              child: GestureDetector(
                onTap: isBooked ? null : () => setState(() => _selectedTime = time),
                child: Container(
                  height: 45,
                  margin: EdgeInsets.only(right: idx == 2 ? 0 : 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.transparent : const Color(0xFF1A1C1D),
                    border: Border.all(
                      color: isSelected ? const Color(0xFFD4AF37) : (isBooked ? Colors.white10 : Colors.white24),
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: isSelected ? const Color(0xFFD4AF37) : (isBooked ? Colors.white24 : Colors.white),
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      decoration: isBooked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C1D),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFD4AF37).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.sports_tennis, color: Color(0xFFD4AF37)),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Estadio Central #01", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("11:00 AM - 01:00 PM (120 min)", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("\$210.00", style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 20)),
              Text("IVA INCL.", style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 85,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1C1D),
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, "Inicio", false),
          _buildNavItem(Icons.calendar_month, "Reservas", true),
          _buildNavItem(Icons.search, "Explorar", false),
          _buildNavItem(Icons.person_outline, "Perfil", false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? const Color(0xFFD4AF37) : Colors.grey),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, color: isActive ? const Color(0xFFD4AF37) : Colors.grey, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
        if (isActive) ...[
          const SizedBox(height: 4),
          Container(width: 4, height: 4, decoration: const BoxDecoration(color: Color(0xFFD4AF37), shape: BoxShape.circle)),
        ]
      ],
    );
  }
}
