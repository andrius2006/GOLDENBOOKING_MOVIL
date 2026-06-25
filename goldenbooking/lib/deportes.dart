import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp ());
}

class Deportes extends StatelessWidget {
  const  Deportes ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOLDENBOOKING Sports',
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
      home: const SportsModule(),
    );
  }
}

class SportsModule extends StatefulWidget {
  const SportsModule({super.key});

  @override
  State<SportsModule> createState() => _SportsModuleState();
}

class _SportsModuleState extends State<SportsModule> {
  String _selectedSport = "Fútbol";
  int _selectedSlotIndex = 2; // 10:00 AM selected by default

  final List<Map<String, dynamic>> _sports = [
    {"name": "Fútbol", "icon": Icons.sports_soccer},
    {"name": "Basquetbol", "icon": Icons.sports_basketball},
    {"name": "Tenis", "icon": Icons.sports_tennis},
    {"name": "Pádel", "icon": Icons.sports_tennis_outlined},
    {"name": "Gimnasio", "icon": Icons.fitness_center},
    {"name": "Natación", "icon": Icons.pool},
    {"name": "Voleibol", "icon": Icons.sports_volleyball},
  ];

  final List<String> _timeSlots = [
    "08:00 AM", "09:00 AM", "10:00 AM", "11:00 AM",
    "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM",
    "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121415),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'GOLDENBOOKING',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFFD4AF37),
            child: Icon(Icons.person, size: 20, color: Colors.black),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Elite Sports Arenas",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Reserve space in our world-class facilities.",
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
            const SizedBox(height: 24),

            // Sport Categories (Scrollable)
            const Text(
              "Select Category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _sports.map((sport) => Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _sportTab(sport['name'], sport['icon'], _selectedSport == sport['name']),
                )).toList(),
              ),
            ),
            const SizedBox(height: 32),

            // Time Slot Selection
            const Text(
              "Available Time Slots",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.2,
              ),
              itemCount: _timeSlots.length,
              itemBuilder: (context, index) {
                return _timeSlot(_timeSlots[index], _selectedSlotIndex == index, index);
              },
            ),
            const SizedBox(height: 32),

            // Reservation Summary Card
            _reservationSummary(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _sportTab(String label, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => _selectedSport = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD4AF37) : const Color(0xFF1A1C1D),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? const Color(0xFFD4AF37) : Colors.white10),
          boxShadow: isSelected ? [
            BoxShadow(
              color: const Color(0xFFD4AF37).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ] : null,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: isSelected ? Colors.black : const Color(0xFFD4AF37)),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timeSlot(String label, bool isSelected, int index) {
    return GestureDetector(
      onTap: () => setState(() => _selectedSlotIndex = index),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD4AF37).withOpacity(0.15) : const Color(0xFF1A1C1D),
          border: Border.all(
            color: isSelected ? const Color(0xFFD4AF37) : Colors.white12,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFFD4AF37) : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _reservationSummary() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C1D),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Booking Summary",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Colors.white12),
          ),
          _summaryRow("Category", _selectedSport),
          const SizedBox(height: 12),
          _summaryRow("Slot", _timeSlots[_selectedSlotIndex]),
          const SizedBox(height: 12),
          _summaryRow("Price", "\$45.00"),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4AF37),
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "CONFIRM RESERVATION",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[500])),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      ],
    );
  }
}
