import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOLDENBOOKING',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Montserrat', // Asegúrate de tener Montserrat en pubspec.yaml
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
          primary: const Color(0xFFD4AF37),
          surface: const Color(0xFF1A1C1D),
          brightness: Brightness.dark,
        ),
      ),
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AccommodationModule(),
    const SportsModule(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar Navigation (Desktop/Web)
          NavigationRail(
            backgroundColor: const Color(0xFF121415),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            leading: const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'GB',
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.hotel),
                selectedIcon: Icon(Icons.hotel, color: Color(0xFFD4AF37)),
                label: Text('Hospedaje'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.sports_tennis),
                selectedIcon: Icon(Icons.sports_tennis, color: Color(0xFFD4AF37)),
                label: Text('Deportes'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Main Content
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

// --- MODULE 1: ACCOMMODATION (HOSPEDAJE) ---

class AccommodationModule extends StatelessWidget {
  const AccommodationModule({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Luxury Accommodations",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.85,
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const AccommodationCard(
                title: "The Azure Penthouse",
                location: "Monaco Coast",
                price: 1850,
                imageUrl: "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80",
              );
            },
          ),
        ],
      ),
    );
  }
}

class AccommodationCard extends StatelessWidget {
  final String title;
  final String location;
  final double price;
  final String imageUrl;

  const AccommodationCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(location, style: TextStyle(color: Colors.grey[400])),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$$price / night", style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () => _showDatePicker(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD4AF37),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Book Now"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFD4AF37),
              onPrimary: Colors.black,
              surface: Color(0xFF1A1C1D),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      // Logic for total price calculation could go here
    }
  }
}

// --- MODULE 2: SPORTS SPACES (DEPORTES) ---

class SportsModule extends StatelessWidget {
  const SportsModule({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Elite Sports Arenas",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _sportTab("Tennis & Paddle", true),
              const SizedBox(width: 12),
              _sportTab("Soccer Field", false),
              const SizedBox(width: 12),
              _sportTab("Gymnasium", false),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Select Time Slot", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 2.5,
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        final time = 8 + index;
                        return _timeSlot("${time}:00 AM", index == 2);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: _reservationSummary(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sportTab(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFD4AF37) : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFD4AF37)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : const Color(0xFFD4AF37),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _timeSlot(String label, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFD4AF37).withOpacity(0.2) : Colors.transparent,
        border: Border.all(color: isSelected ? const Color(0xFFD4AF37) : Colors.white24),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xFFD4AF37) : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _reservationSummary() {
    return Card(
      color: const Color(0xFF1A1C1D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your Selection", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Court"), Text("Gold Court #04", style: TextStyle(fontWeight: FontWeight.bold))],
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Time"), Text("10:00 AM - 11:00 AM", style: TextStyle(fontWeight: FontWeight.bold))],
            ),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Price", style: TextStyle(fontSize: 16)),
                Text("\$45.00", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37))),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Confirm Reservation", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}