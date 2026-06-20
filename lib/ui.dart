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

            // HERO SECTION (UNCHANGED + BUTTONS RESTORED)
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
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        const Text(
                          "SAVE BIG\nWITH OUR CAR RENTAL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Premium cars at affordable prices.\nBook your dream ride today.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 35),

                        // 🔥 BUTTONS ADDED BACK
                        Row(
                          children: [

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 18,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Book Ride"),
                            ),

                            const SizedBox(width: 15),

                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 18,
                                ),
                              ),
                              onPressed: () {},
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

            // BOOKING SECTION (UPDATED - SAME AS BEFORE)
            BookingSection(),

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
  String pickupTime = "Pick-up Time";

  Future<void> pickDate(Function(String) onSelect) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      onSelect("${date.day}-${date.month}-${date.year}");
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        pickupTime = time.format(context);
      });
    }
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
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Book a Car",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                box(carType, () {
                  setState(() => carType = "SUV Selected");
                }),
                const SizedBox(width: 10),
                box(pickupLocation, () {
                  setState(() => pickupLocation = "Abbottabad");
                }),
                const SizedBox(width: 10),
                box(dropoffLocation, () {
                  setState(() => dropoffLocation = "Islamabad");
                }),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                box(pickupDate, () {
                  pickDate((value) {
                    setState(() => pickupDate = value);
                  });
                }),
                const SizedBox(width: 10),
                box(dropoffDate, () {
                  pickDate((value) {
                    setState(() => dropoffDate = value);
                  });
                }),
                const SizedBox(width: 10),
                box(pickupTime, () {
                  pickTime();
                }),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1E3C72),
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15),
              ),
              onPressed: () {},
              child: const Text("Search Cars"),
            ),
          ],
        ),
      ),
    );
  }
}