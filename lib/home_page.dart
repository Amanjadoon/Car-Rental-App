import 'package:flutter/material.dart';
import 'login_page.dart';
import 'cars_page.dart';
import 'about_page.dart';
import 'booking_confirmation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoggedIn = false;
  String loggedInEmail = '';

  void _showLoginDialog() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LoginPage(
          onLoginSuccess: (email) {
            setState(() {
              isLoggedIn = true;
              loggedInEmail = email;
            });
          },
        ),
      ),
    );
  }

  void _logout() {
    setState(() {
      isLoggedIn = false;
      loggedInEmail = '';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Logged out successfully'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Widget _navButton(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        elevation: 2,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1E3C72), Color(0xff2A5298)],
            ),
          ),
        ),
        title: Row(
          children: [
            const Icon(Icons.directions_car, color: Colors.orange, size: 28),
            const SizedBox(width: 8),
            const Text(
              'CAR Rental',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        actions: [
          _navButton('Home', () {}),
          _navButton(
            'About',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutPage()),
            ),
          ),
          _navButton(
            'Cars',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CarsPage()),
            ),
          ),
          if (isLoggedIn)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PopupMenuButton<String>(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.person, color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      loggedInEmail.split('@')[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
                onSelected: (val) {
                  if (val == 'logout') _logout();
                },
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: 'logout',
                    child: Row(
                      children: const [
                        Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Logout'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ElevatedButton(
                onPressed: _showLoginDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── HERO SECTION ──
            _HeroSection(isLoggedIn: isLoggedIn, onBookNow: _showLoginDialog),
            const SizedBox(height: 30),

            // ── BOOKING FORM ──
            BookingSection(
              isLoggedIn: isLoggedIn,
              onRequireLogin: _showLoginDialog,
            ),
            const SizedBox(height: 50),

            // ── WHY CHOOSE US ──
            const _WhyChooseUs(),
            const SizedBox(height: 50),

            // ── FEATURED CARS ──
            _FeaturedCars(
              isLoggedIn: isLoggedIn,
              onRequireLogin: _showLoginDialog,
            ),
            const SizedBox(height: 50),

            // ── TESTIMONIALS ──
            const _Testimonials(),
            const SizedBox(height: 50),

            // ── FOOTER ──
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// HERO SECTION
// ─────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  final bool isLoggedIn;
  final VoidCallback onBookNow;

  const _HeroSection({required this.isLoggedIn, required this.onBookNow});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1549399542-7e3f8b79c341?w=1500',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xff1E3C72),
                child: const Center(
                  child: Icon(Icons.directions_car, size: 100, color: Colors.white54),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.75),
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Text(
                    '🚗 Plan Your Trip Now',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'SAVE BIG\nWITH OUR\nCAR RENTAL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Affordable rates · Premium vehicles · 24/7 support',
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: onBookNow,
                      icon: const Icon(Icons.calendar_today, size: 16),
                      label: const Text('Book Ride'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const AboutPage()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Learn More'),
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
}

// ─────────────────────────────────────────────
// BOOKING SECTION
// ─────────────────────────────────────────────
class BookingSection extends StatefulWidget {
  final bool isLoggedIn;
  final VoidCallback onRequireLogin;

  const BookingSection({
    super.key,
    required this.isLoggedIn,
    required this.onRequireLogin,
  });

  @override
  State<BookingSection> createState() => _BookingSectionState();
}

class _BookingSectionState extends State<BookingSection> {
  String carType = 'Select Car Type';
  String pickupLocation = 'Pick-up Location';
  String dropoffLocation = 'Drop-off Location';
  String pickupDate = 'Pick-up Date';
  String dropoffDate = 'Drop-off Date';

  final List<String> cars = [
    'Honda Civic',
    'Toyota Corolla',
    'Suzuki Alto',
    'BMW 3 Series',
    'Audi A4',
    'Toyota Fortuner',
    'Honda BRV',
  ];
  final List<String> locations = [
    'Islamabad',
    'Lahore',
    'Karachi',
    'Abbottabad',
    'Peshawar',
    'Quetta',
    'Multan',
    'Faisalabad',
    'Sialkot',
    'Gujranwala',
    'Rawalpindi',
    'Murree',
    'Hunza',
  ];

  void _pickLocation(Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Select Location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              children: locations.map((e) {
                return ListTile(
                  leading: const Icon(Icons.location_on, color: Color(0xff1E3C72)),
                  title: Text(e),
                  onTap: () {
                    setState(() => onSelect(e));
                    Navigator.pop(ctx);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _selectCar() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Select Car',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              children: cars.map((car) {
                return ListTile(
                  leading: const Icon(Icons.directions_car, color: Color(0xff1E3C72)),
                  title: Text(car),
                  onTap: () {
                    setState(() => carType = car);
                    Navigator.pop(ctx);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _box(String text, IconData icon, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xff1E3C72), size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: text.contains('Select') ||
                            text.contains('Location') ||
                            text.contains('Date')
                        ? Colors.grey.shade500
                        : Colors.black87,
                    fontSize: 13,
                  ),
                ),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),
    );
  }

  bool get _isFormComplete =>
      carType != 'Select Car Type' &&
      pickupLocation != 'Pick-up Location' &&
      dropoffLocation != 'Drop-off Location' &&
      pickupDate != 'Pick-up Date' &&
      dropoffDate != 'Drop-off Date';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Book Your Ride',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff1E3C72),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Fill in the details below to get started',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _box(carType, Icons.directions_car, _selectCar),
                const SizedBox(width: 10),
                _box(
                  pickupLocation,
                  Icons.location_on,
                  () => _pickLocation((v) => setState(() => pickupLocation = v)),
                ),
                const SizedBox(width: 10),
                _box(
                  dropoffLocation,
                  Icons.flag,
                  () => _pickLocation((v) => setState(() => dropoffLocation = v)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _box(pickupDate, Icons.calendar_today, () async {
                  final d = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (d != null) {
                    setState(() {
                      pickupDate = '${d.day}-${d.month}-${d.year}';
                    });
                  }
                }),
                const SizedBox(width: 10),
                _box(dropoffDate, Icons.event_available, () async {
                  final d = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (d != null) {
                    setState(() {
                      dropoffDate = '${d.day}-${d.month}-${d.year}';
                    });
                  }
                }),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.search),
                label: const Text(
                  'Search Available Cars',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1E3C72),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (!widget.isLoggedIn) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please login to book a car'),
                        backgroundColor: Colors.red,
                        action: SnackBarAction(
                          label: 'Login',
                          textColor: Colors.white,
                          onPressed: widget.onRequireLogin,
                        ),
                      ),
                    );
                    return;
                  }
                  if (!_isFormComplete) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all booking details'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingConfirmationPage(
                        car: carType,
                        pickup: pickupLocation,
                        dropoff: dropoffLocation,
                        pickupDate: pickupDate,
                        dropoffDate: dropoffDate,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// WHY CHOOSE US
// ─────────────────────────────────────────────
class _WhyChooseUs extends StatelessWidget {
  const _WhyChooseUs();

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'icon': Icons.attach_money,
        'title': 'Best Prices',
        'desc': 'Unbeatable rates with no hidden charges. Transparent pricing always.',
      },
      {
        'icon': Icons.verified_user,
        'title': 'Safe & Reliable',
        'desc': 'All vehicles are fully insured and regularly serviced for your safety.',
      },
      {
        'icon': Icons.support_agent,
        'title': '24/7 Support',
        'desc': 'Our team is available round the clock to assist you anytime.',
      },
      {
        'icon': Icons.location_on,
        'title': 'Wide Coverage',
        'desc': 'Available across 13+ major cities in Pakistan.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Why Choose Us?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff1E3C72),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'We deliver excellence in every ride',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 30),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
            children: features.map((f) {
              return Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xff1E3C72).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        f['icon'] as IconData,
                        color: const Color(0xff1E3C72),
                        size: 26,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      f['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xff1E3C72),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      f['desc'] as String,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// FEATURED CARS
// ─────────────────────────────────────────────
class _FeaturedCars extends StatelessWidget {
  final bool isLoggedIn;
  final VoidCallback onRequireLogin;

  const _FeaturedCars({required this.isLoggedIn, required this.onRequireLogin});

  @override
  Widget build(BuildContext context) {
    final cars = [
      {
        'name': 'Toyota Corolla',
        'type': 'Sedan',
        'price': 'PKR 5,000/day',
        'seats': '5',
        'fuel': 'Petrol',
        'image': 'https://images.unsplash.com/photo-1590362891991-f776e747a588?w=600',
        'color': const Color(0xff1E3C72),
      },
      {
        'name': 'Honda Civic',
        'type': 'Sedan',
        'price': 'PKR 6,000/day',
        'seats': '5',
        'fuel': 'Petrol',
        'image': 'https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=600',
        'color': const Color(0xff2A5298),
      },
      {
        'name': 'Toyota Fortuner',
        'type': 'SUV',
        'price': 'PKR 12,000/day',
        'seats': '7',
        'fuel': 'Diesel',
        'image': 'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=600',
        'color': const Color(0xffE65100),
      },
      {
        'name': 'BMW 3 Series',
        'type': 'Luxury',
        'price': 'PKR 20,000/day',
        'seats': '5',
        'fuel': 'Petrol',
        'image': 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=600',
        'color': const Color(0xff1B5E20),
      },
    ];

    return Column(
      children: [
        const Text(
          'Featured Cars',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff1E3C72),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Handpicked vehicles for your comfort',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: cars.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, i) {
              final car = cars[i];
              return Container(
                width: 230,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                      child: Image.network(
                        car['image'] as String,
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 130,
                          color: (car['color'] as Color).withOpacity(0.2),
                          child: Icon(
                            Icons.directions_car,
                            size: 60,
                            color: car['color'] as Color,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  car['name'] as String,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: (car['color'] as Color).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  car['type'] as String,
                                  style: TextStyle(
                                    color: car['color'] as Color,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.people, size: 14, color: Colors.grey.shade500),
                              const SizedBox(width: 4),
                              Text(
                                '${car['seats']} seats',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade500),
                              ),
                              const SizedBox(width: 12),
                              Icon(Icons.local_gas_station,
                                  size: 14, color: Colors.grey.shade500),
                              const SizedBox(width: 4),
                              Text(
                                car['fuel'] as String,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                car['price'] as String,
                                style: TextStyle(
                                  color: car['color'] as Color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (!isLoggedIn) {
                                    onRequireLogin();
                                  } else {
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
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: car['color'] as Color,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Book',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// TESTIMONIALS
// ─────────────────────────────────────────────
class _Testimonials extends StatelessWidget {
  const _Testimonials();

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {
        'name': 'Ahmed Khan',
        'city': 'Lahore',
        'review': 'Excellent service! The car was spotless and pick-up was on time. Will definitely book again.',
        'stars': 5,
      },
      {
        'name': 'Sara Malik',
        'city': 'Islamabad',
        'review': 'Very affordable prices and professional staff. Highly recommended for long trips.',
        'stars': 5,
      },
      {
        'name': 'Usman Ali',
        'city': 'Karachi',
        'review': 'Great experience overall! App is easy to use and the cars are well maintained.',
        'stars': 4,
      },
    ];

    return Column(
      children: [
        const Text(
          'What Our Customers Say',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xff1E3C72),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: reviews.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, i) {
              final r = reviews[i];
              return Container(
                width: 280,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color(0xff1E3C72).withOpacity(0.15),
                          child: Text(
                            (r['name'] as String)[0],
                            style: const TextStyle(
                              color: Color(0xff1E3C72),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              r['name'] as String,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              r['city'] as String,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: List.generate(
                        r['stars'] as int,
                        (_) => const Icon(Icons.star, color: Colors.orange, size: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      r['review'] as String,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// FOOTER
// ─────────────────────────────────────────────
class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff1E3C72), Color(0xff2A5298)],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.directions_car, color: Colors.orange, size: 30),
              SizedBox(width: 10),
              Text(
                'CAR Rental',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Your trusted car rental partner across Pakistan.\nAffordable · Reliable · Available 24/7',
            style: TextStyle(color: Colors.white60, fontSize: 13),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerChip(Icons.phone, '+92 300 1234567'),
              const SizedBox(width: 20),
              _footerChip(Icons.email, 'info@carrental.pk'),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white24),
          const SizedBox(height: 10),
          const Text(
            '© 2025 CAR Rental. All rights reserved.',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
    );
  }

  static Widget _footerChip(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange, size: 16),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13)),
      ],
    );
  }
}