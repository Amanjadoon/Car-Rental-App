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
    // Existing Cars

    {
      'name': 'Toyota Corolla',
      'type': 'Sedan',
      'price': 5000,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://images.unsplash.com/photo-1590362891991-f776e747a588?w=600',
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
      'image':
          'https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=600',
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
      'image':
          'https://images.unsplash.com/photo-1502877338535-766e1452684a?w=600',
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
      'image':
          'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=600',
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
      'image':
          'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=600',
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
      'image':
          'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=600',
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
      'image':
          'https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=600',
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
      'image':
          'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=600',
      'color': Colors.brown,
      'rating': 4.0,
    },

    // Additional Pakistani Cars

    {
      'name': 'Suzuki Cultus',
      'type': 'Hatchback',
      'price': 3200,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?suzuki,car',
      'color': Colors.green,
      'rating': 4.5,
    },

    {
      'name': 'Suzuki Wagon R',
      'type': 'Hatchback',
      'price': 3000,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Manual',
      'image':
          'https://source.unsplash.com/600x400/?wagonr',
      'color': Colors.orange,
      'rating': 4.4,
    },

    {
      'name': 'Suzuki Swift',
      'type': 'Hatchback',
      'price': 4200,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?swift,car',
      'color': Colors.red,
      'rating': 4.7,
    },

    {
      'name': 'Honda City',
      'type': 'Sedan',
      'price': 5500,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?honda,city',
      'color': Colors.blue,
      'rating': 4.7,
    },

    {
      'name': 'Toyota Yaris',
      'type': 'Sedan',
      'price': 5800,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?toyota,yaris',
      'color': Colors.purple,
      'rating': 4.6,
    },

    {
      'name': 'Toyota Prius',
      'type': 'Sedan',
      'price': 7500,
      'seats': 5,
      'fuel': 'Hybrid',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?prius',
      'color': Colors.cyan,
      'rating': 4.8,
    },

    {
      'name': 'KIA Sportage',
      'type': 'SUV',
      'price': 9000,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?kia,sportage',
      'color': Colors.black,
      'rating': 4.9,
    },

    {
      'name': 'Hyundai Tucson',
      'type': 'SUV',
      'price': 9500,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?hyundai,tucson',
      'color': Colors.indigo,
      'rating': 4.8,
    },

    {
      'name': 'MG HS',
      'type': 'SUV',
      'price': 9800,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?mg,car',
      'color': Colors.redAccent,
      'rating': 4.8,
    },

    {
      'name': 'Toyota Land Cruiser',
      'type': 'Luxury',
      'price': 25000,
      'seats': 7,
      'fuel': 'Diesel',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?landcruiser',
      'color': Colors.black87,
      'rating': 5.0,
    },

    {
      'name': 'Toyota Revo',
      'type': 'SUV',
      'price': 13000,
      'seats': 5,
      'fuel': 'Diesel',
      'transmission': 'Manual',
      'image':
          'https://source.unsplash.com/600x400/?hilux',
      'color': Colors.blueGrey,
      'rating': 4.9,
    },

    {
      'name': 'Changan Oshan X7',
      'type': 'SUV',
      'price': 10000,
      'seats': 7,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?suv',
      'color': Colors.deepOrange,
      'rating': 4.7,
    },

    {
      'name': 'Toyota Aqua',
      'type': 'Hatchback',
      'price': 4200,
      'seats': 5,
      'fuel': 'Hybrid',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?toyota,aqua',
      'color': Colors.lightBlue,
      'rating': 4.6,
    },

    {
      'name': 'Daihatsu Mira',
      'type': 'Hatchback',
      'price': 2800,
      'seats': 4,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?daihatsu',
      'color': Colors.pink,
      'rating': 4.5,
    },

    {
      'name': 'Hyundai Elantra',
      'type': 'Sedan',
      'price': 8000,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?elantra',
      'color': Colors.deepPurple,
      'rating': 4.8,
    },

    {
      'name': 'Honda Accord',
      'type': 'Luxury',
      'price': 18000,
      'seats': 5,
      'fuel': 'Petrol',
      'transmission': 'Automatic',
      'image':
          'https://source.unsplash.com/600x400/?accord',
      'color': Colors.blueGrey,
      'rating': 4.9,
    },
  ];

  final List<String> _filters = [
    'All',
    'Sedan',
    'SUV',
    'Hatchback',
    'Luxury'
  ];

  List<Map<String, dynamic>> get _filteredCars {
    if (_selectedFilter == 'All') return _allCars;
    return _allCars
        .where((c) => c['type'] == _selectedFilter)
        .toList();
  }
   @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xffF5F7FA),
    appBar: AppBar(
      title: const Text(
        "Our Cars",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff1E3C72),
              Color(0xff2A5298),
            ],
          ),
        ),
      ),
    ),

    body: Column(
      children: [

        const SizedBox(height: 10),

        // FILTERS

        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _filters.length,
            itemBuilder: (context, index) {
              final filter = _filters[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                child: FilterChip(
                  label: Text(filter),
                  selected:
                      _selectedFilter == filter,
                  onSelected: (_) {
                    setState(() {
                      _selectedFilter =
                          filter;
                    });
                  },
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: GridView.builder(
            padding:
                const EdgeInsets.all(12),

            itemCount:
                _filteredCars.length,

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 3,

              crossAxisSpacing: 12,

              mainAxisSpacing: 12,

              childAspectRatio: 1.35,
            ),

            itemBuilder:
                (context, index) {

              final car =
                  _filteredCars[index];

              return _CarCard(
                car: car,
              );
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // CAR IMAGE

          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),

            child: Image.network(
              car['image'],
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 80,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(
                      Icons.directions_car,
                      size: 50,
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  car['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [

                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      car['rating'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  "PKR ${car['price']}/day",
                  style: TextStyle(
                    color: car['color'],
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "${car['seats']} Seats",
                  style: const TextStyle(
                    fontSize: 9,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  car['fuel'],
                  style: const TextStyle(
                    fontSize: 9,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  car['transmission'],
                  style: const TextStyle(
                    fontSize: 9,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          car['color'],

                      foregroundColor:
                          Colors.white,

                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 10,
                      ),

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),

                    onPressed: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              BookingConfirmationPage(
                            car: car['name'],
                            pickup: "",
                            dropoff: "",
                            pickupDate: "",
                            dropoffDate: "",
                          ),
                        ),
                      );
                    },

                    child: const Text(
                      "Book Now",
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}