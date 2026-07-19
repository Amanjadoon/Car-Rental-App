import 'package:flutter/material.dart';

class BookingConfirmationPage extends StatefulWidget {
  final String car;
  final String pickup;
  final String dropoff;
  final String pickupDate;
  final String dropoffDate;

  const BookingConfirmationPage({
    super.key,
    required this.car,
    required this.pickup,
    required this.dropoff,
    required this.pickupDate,
    required this.dropoffDate,
  });

  @override
  State<BookingConfirmationPage> createState() =>
      _BookingConfirmationPageState();
}

class _BookingConfirmationPageState extends State<BookingConfirmationPage> {
  bool _confirmed = false;
  bool _isLoading = false;

  // Local editable state (in case came from cars page without pre-filled values)
  late String _car;
  late String _pickup;
  late String _dropoff;
  late String _pickupDate;
  late String _dropoffDate;

  final List<String> _cars = [
    'Toyota Corolla',
    'Honda Civic',
    'Suzuki Alto',
    'Toyota Fortuner',
    'Honda BRV',
    'BMW 3 Series',
    'Audi A4',
  ];

  final List<String> _locations = [
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

  final Map<String, int> _carPrices = {
    'Toyota Corolla': 5000,
    'Honda Civic': 6000,
    'Suzuki Alto': 2500,
    'Toyota Fortuner': 12000,
    'Honda BRV': 8000,
    'BMW 3 Series': 20000,
    'Audi A4': 22000,
  };

  @override
  void initState() {
    super.initState();
    _car = widget.car.isEmpty ? 'Toyota Corolla' : widget.car;
    _pickup = widget.pickup.isEmpty ? '' : widget.pickup;
    _dropoff = widget.dropoff.isEmpty ? '' : widget.dropoff;
    _pickupDate = widget.pickupDate.isEmpty ? '' : widget.pickupDate;
    _dropoffDate = widget.dropoffDate.isEmpty ? '' : widget.dropoffDate;
  }

  int get _dailyPrice => _carPrices[_car] ?? 5000;

  int get _numberOfDays {
    try {
      if (_pickupDate.isEmpty || _dropoffDate.isEmpty) return 1;
      final p = _pickupDate.split('-');
      final d = _dropoffDate.split('-');
      final start = DateTime(int.parse(p[2]), int.parse(p[1]), int.parse(p[0]));
      final end = DateTime(int.parse(d[2]), int.parse(d[1]), int.parse(d[0]));
      final diff = end.difference(start).inDays;
      return diff <= 0 ? 1 : diff;
    } catch (_) {
      return 1;
    }
  }

  int get _totalPrice => _dailyPrice * _numberOfDays;

  bool get _isReady =>
      _pickup.isNotEmpty &&
      _dropoff.isNotEmpty &&
      _pickupDate.isNotEmpty &&
      _dropoffDate.isNotEmpty;

  void _pickLocation(String label, Function(String) onPick) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              label,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              children: _locations
                  .map((loc) => ListTile(
                        leading: const Icon(Icons.location_on,
                            color: Color(0xff1E3C72)),
                        title: Text(loc),
                        onTap: () {
                          onPick(loc);
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
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
      builder: (_) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Select Car',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              children: _cars
                  .map((c) => ListTile(
                        leading: const Icon(Icons.directions_car,
                            color: Color(0xff1E3C72)),
                        title: Text(c),
                        subtitle: Text(
                            'PKR ${_carPrices[c].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')} / day'),
                        onTap: () {
                          setState(() => _car = c);
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmBooking() async {
    if (!_isReady) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all booking details'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
      _confirmed = true;
    });
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
        title: Text(
          _confirmed ? 'Booking Confirmed!' : 'Confirm Booking',
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(
      maxWidth: 650,
    ),
    child: _confirmed
        ? _buildSuccessScreen()
        : _buildBookingForm(),
  ),
),
    );
  }

  // ── BOOKING FORM ──
  Widget _buildBookingForm() {
    return Center(
  child: SingleChildScrollView(
    padding: const EdgeInsets.all(40),
    child: Container(
      width: 550,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary card
          Container(
            padding: const EdgeInsets.all(20),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Booking Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1E3C72),
                  ),
                ),
                const Divider(height: 24),

                // Car selector
                _BookingRow(
                  icon: Icons.directions_car,
                  label: 'Car',
                  value: _car,
                  onTap: () {},
                ),
                const SizedBox(height: 14),

                // Pickup location
                _BookingRow(
                  icon: Icons.location_on,
                  label: 'Pick-up Location',
                  value: _pickup.isEmpty ? 'Tap to select' : _pickup,
                  isEmpty: _pickup.isEmpty,
                  onTap: () {},
                ),
                const SizedBox(height: 14),

                // Drop-off location
                _BookingRow(
                  icon: Icons.flag,
                  label: 'Drop-off Location',
                  value: _dropoff.isEmpty ? 'Tap to select' : _dropoff,
                  isEmpty: _dropoff.isEmpty,
                  onTap: () {},
                ),
                const SizedBox(height: 14),

                // Pickup date
                _BookingRow(
                  icon: Icons.calendar_today,
                  label: 'Pick-up Date',
                  value: _pickupDate.isEmpty ? 'Tap to select' : _pickupDate,
                  isEmpty: _pickupDate.isEmpty,
                  onTap: () {},
                ),
                const SizedBox(height: 14),

                // Drop-off date
                _BookingRow(
                  icon: Icons.event_available,
                  label: 'Drop-off Date',
                  value: _dropoffDate.isEmpty ? 'Tap to select' : _dropoffDate,
                  isEmpty: _dropoffDate.isEmpty,
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Price breakdown
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Price Breakdown',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1E3C72),
                  ),
                ),
                const Divider(height: 20),
                _priceRow('Daily Rate', 'PKR $_dailyPrice'),
                const SizedBox(height: 8),
                _priceRow('Number of Days', '$_numberOfDays day(s)'),
                const SizedBox(height: 8),
                _priceRow('Service Fee', 'PKR 500'),
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'PKR ${(_totalPrice + 500).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xff1E3C72),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Confirm button
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _confirmBooking,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1E3C72),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.5),
                    )
                  : const Text(
                      'CONFIRM & PAY',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
               ),
              ),
            ),
           ],
          ),
         ),
       ),
     
   );
  }

  Widget _priceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  // ── SUCCESS SCREEN ──
  Widget _buildSuccessScreen() {
    final bookingId =
        'CR${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Booking Confirmed!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff1E3C72),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your car is booked. Have a safe journey!',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 30),

            // Booking details card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
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
                  // Booking ID
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xff1E3C72).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Booking ID: ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          bookingId,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1E3C72),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _confirmRow(Icons.directions_car, 'Car', _car),
                  _confirmRow(Icons.location_on, 'Pick-up', _pickup),
                  _confirmRow(Icons.flag, 'Drop-off', _dropoff),
                  _confirmRow(Icons.calendar_today, 'Pick-up Date', _pickupDate),
                  _confirmRow(Icons.event_available, 'Drop-off Date', _dropoffDate),
                  _confirmRow(Icons.timelapse, 'Duration', '$_numberOfDays day(s)'),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Paid',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'PKR ${(_totalPrice + 500).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text(
                  'BACK TO HOME',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1E3C72),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _confirmRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xff1E3C72), size: 18),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  final bool isEmpty;

  const _BookingRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    this.isEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xffF5F7FA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isEmpty ? Colors.grey.shade300 : const Color(0xff1E3C72).withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xff1E3C72), size: 20),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: isEmpty ? Colors.grey.shade400 : Colors.black87,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20),
          ],
        ),
      ),
    );
  }
}