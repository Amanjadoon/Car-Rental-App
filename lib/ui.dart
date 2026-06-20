import 'package:flutter/material.dart';

void main() {
  runApp(const CarRentalApp());
}

class CarRentalApp extends StatelessWidget {
  const CarRentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Car Rental",
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      // TOP BAR (UNCHANGED)
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1E3C72), Color(0xff2A5298)],
            ),
          ),
        ),
        title: const Text(
          "CAR Rental",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(child: Text("Home", style: TextStyle(color: Colors.white))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(child: Text("About", style: TextStyle(color: Colors.white))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(child: Text("Cars", style: TextStyle(color: Colors.white))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(child: Text("Contact", style: TextStyle(color: Colors.white))),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // HERO SECTION (UNCHANGED)
            SizedBox(
              height: 550,
              width: double.infinity,
              child: Stack(
                children: [

                  Positioned.fill(
                    child: Image.network(
                      "https://images.unsplash.com/photo-1549399542-7e3f8b79c341?w=1500",
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.45),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 70, top: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "🚗 Plan Your Trip Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 25),

                        const Text(
                          "SAVE BIG\nWITH OUR CAR RENTAL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 35),

                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                              child: const Text("Book Ride"),
                            ),
                            const SizedBox(width: 15),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white),
                              ),
                              child: const Text("Learn More"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const BookingSection(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class BookingSection extends StatefulWidget {
  const BookingSection({super.key});

  @override
  State<BookingSection> createState() => _BookingSectionState();
}

class _BookingSectionState extends State<BookingSection> {
  String carType = "Select Car Type";
  String pickupLocation = "Pick-up Location";
  String dropoffLocation = "Drop-off Location";
  String pickupDate = "Pick-up Date";
  String dropoffDate = "Drop-off Date";

  final List<String> locations = [
    "Islamabad",
    "Lahore",
    "Karachi",
    "Abbottabad",
    "Peshawar",
    "Quetta",
    "Multan",
    "Faisalabad",
    "Sialkot",
    "Gujranwala",
    "Rawalpindi",
    "Murree",
    "Hunza"
  ];

  void pickLocation(Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: locations.map((e) {
            return ListTile(
              title: Text(e),
              onTap: () {
                setState(() => onSelect(e));
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  Widget box(String text, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Expanded(child: Text(text)),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [

          Row(
            children: [

              // ✅ ONLY CHANGE: Select Car -> Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    carType = "Honda Civic";
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1E3C72),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                child: Text(
                  carType,
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(width: 10),

              box(pickupLocation, () => pickLocation((v) => pickupLocation = v)),

              const SizedBox(width: 10),

              box(dropoffLocation, () => pickLocation((v) => dropoffLocation = v)),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              box(pickupDate, () async {
                DateTime? d = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (d != null) {
                  setState(() {
                    pickupDate = "${d.day}-${d.month}-${d.year}";
                  });
                }
              }),

              const SizedBox(width: 10),

              box(dropoffDate, () async {
                DateTime? d = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (d != null) {
                  setState(() {
                    dropoffDate = "${d.day}-${d.month}-${d.year}";
                  });
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}