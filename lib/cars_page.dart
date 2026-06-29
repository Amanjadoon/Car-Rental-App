import 'package:flutter/material.dart';
import 'booking_confirmation_page.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _allCars = [
    {
      'name': 'Toyota Corolla',
      'type': 'Sedan',
      'price': 5000,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image': 'https://images.unsplash.com/photo-1590362891991-f776e747a588?w=600',
      'color': const Color(0xff1E3C72),
      'rating': 4.8,
    },
    {
      'name': 'Honda Civic',
      'type': 'Sedan',
      'price': 6000,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image': 'https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=600',
      'color': const Color(0xff2A5298),
      'rating': 4.7,
    },
    {
      'name': 'Suzuki Alto',
      'type': 'Hatchback',
      'price': 2500,
      'seats': 4,
      'fuel': 'Petrol',
      'transmission': 'Manual',
      'image': 'https://images.unsplash.com/photo-1502877338535-766e1452684a?w=600',
      'color': Colors.teal,
      'rating': 4.3,
    },
    {
      'name': 'Toyota Fortuner',
      'type': 'SUV',
      'price': 12000,
      'seats': 7,
      'fuel': 'Diesel',
      'transmission': 'Automatic',
      'image': 'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=600',
      'color': const Color(0xffE65100),
      'rating': 4.9,
    },
    {
      'name': 'Honda BRV',
      'type': 'SUV',
      'price': 8000,
      'seats': 6,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image': 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=600',
      'color': Colors.deepPurple,
      'rating': 4.5,
    },
    {
      'name': 'BMW 3 Series',
      'type': 'Luxury',
      'price': 20000,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image': 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=600',
      'color': const Color(0xff1B5E20),
      'rating': 5.0,
    },
    {
      'name': 'Audi A4',
      'type': 'Luxury',
      'price': 22000,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image': 'https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=600',
      'color': Colors.indigo,
      'rating': 4.9,
    },
    {
      'name': 'Suzuki Mehran',
      'type': 'Hatchback',
      'price': 1800,
      'seats': 4,
      'fuel': 'Petrol',
      'transmission': 'Manual',
      'image': 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=600',
      'color': Colors.brown,
      'rating': 4.0,
    },
  ];

  final List<String> _filters = ['All', 'Sedan', 'SUV', 'Hatchback', 'Luxury'];

  List<Map<String, dynamic>> get _filteredCars {
    if (_selectedFilter == 'All') return _allCars;
    return _allCars.where((c) => c['type'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1E3C72), Color(0xff2A5298)],
            ),
          ),
        ),
        title: const Text('Our Fleet', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Filter chips
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((f) {
                  final selected = _selectedFilter == f;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FilterChip(
                      label: Text(f),
                      selected: selected,
                      onSelected: (_) => setState(() => _selectedFilter = f),
                      selectedColor: const Color(0xff1E3C72),
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black87,
                        fontWeight:
                            selected ? FontWeight.bold : FontWeight.normal,
                      ),
                      backgroundColor: Colors.grey.shade100,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Count
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
            child: Row(
              children: [
                Text(
                  '${_filteredCars.length} cars available',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // Car list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
              itemCount: _filteredCars.length,
              itemBuilder: (_, i) {
                final car = _filteredCars[i];
                return _CarCard(car: car);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CarCard extends StatelessWidget {
  final Map<String, dynamic> car;
  const _CarCard({required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.network(
              car['image'] as String,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 180,
                color: (car['color'] as Color).withOpacity(0.15),
                child: Icon(
                  Icons.directions_car,
                  size: 80,
                  color: car['color'] as Color,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + rating
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        car['name'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            car['rating'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Type badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: (car['color'] as Color).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    car['type'] as String,
                    style: TextStyle(
                      color: car['color'] as Color,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Specs
                Row(
                  children: [
                    _spec(Icons.people, '${car['seats']} Seats'),
                    const SizedBox(width: 18),
                    _spec(Icons.local_gas_station, car['fuel'] as String),
                    const SizedBox(width: 18),
                    _spec(Icons.settings, car['transmission'] as String),
                  ],
                ),

                const SizedBox(height: 16),

                // Price + Book
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price per day',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          'PKR ${car['price'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                          style: TextStyle(
                            color: car['color'] as Color,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.calendar_today, size: 16),
                      label: const Text('Book Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: car['color'] as Color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingConfirmationPage(
                              car: car['name'] as String,
                              pickup: '',
                              dropoff: '',
                              pickupDate: '',
                              dropoffDate: '',
                            ),
                          ),
                        );
                      },
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

  Widget _spec(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 15, color: Colors.grey.shade500),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
      ],
    );
  }
}