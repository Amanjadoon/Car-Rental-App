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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // TOP NAV BAR (like website)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "CAR Rental",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Text("Home", style: TextStyle(color: Colors.black)),
          SizedBox(width: 15),
          Text("About", style: TextStyle(color: Colors.black)),
          SizedBox(width: 15),
          Text("Cars", style: TextStyle(color: Colors.black)),
          SizedBox(width: 15),
          Text("Contact", style: TextStyle(color: Colors.black)),
          SizedBox(width: 15),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ---------------- HERO SECTION ----------------
              Row(
                children: [
                  // LEFT TEXT
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Plan your trip now",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),

                        Text(
                          "Save BIG with our\ncar rental",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "To contribute to positive change and achieve\nsustainability goals with smarter mobility.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  // RIGHT IMAGE (car mock)
                  Expanded(
                    child: Image.network(
                      "https://images.unsplash.com/photo-1549399542-7e3f8b79c341?w=900",
                      height: 220,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ---------------- BUTTONS ----------------
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    onPressed: () {},
                    child: const Text("Book Ride"),
                  ),

                  const SizedBox(width: 10),

                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("Learn More"),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ---------------- BOOKING SECTION ----------------
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Book a Car",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ROW FIELDS
                    Row(
                      children: [
                        Expanded(
                          child: dropdownBox("Select Car Type"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: dropdownBox("Pick-up"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: dropdownBox("Drop-off"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Text("Search"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropdownBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(child: Text(text)),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}