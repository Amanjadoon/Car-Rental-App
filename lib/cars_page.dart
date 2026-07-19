import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'car_details_page.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  String selectedFilter = "All";

  final List<String> filters = [
    "All",
    "Sedan",
    "SUV",
    "Hatchback",
    "Luxury",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E3C72),
        centerTitle: true,
        title: const Text(
          "Our Fleet",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            /// FILTERS
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.map((filter) {
                  bool active = selectedFilter == filter;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: active
                            ? const Color(0xff1E3C72)
                            : Colors.white,
                        foregroundColor: active
                            ? Colors.white
                            : const Color(0xff1E3C72),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        filter,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("cars")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No cars available"),
                    );
                  }

                  List<Map<String, dynamic>> filteredCars = snapshot
                      .data!.docs
                      .map((doc) => doc.data() as Map<String, dynamic>)
                      .where((car) =>
                          selectedFilter == "All" ||
                          car["type"] == selectedFilter)
                      .toList();

                  return Column(
                    children: [
                      Text(
                        "${filteredCars.length} Cars Available",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 25),

                      Expanded(
                        child: GridView.builder(
                          itemCount: filteredCars.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 420,
                            mainAxisExtent: 470,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 25,
                          ),
                          itemBuilder: (context, index) {
                            final car = filteredCars[index];
                            return Card(
  elevation: 8,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(22),
  ),
  clipBehavior: Clip.antiAlias,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      /// IMAGE
      SizedBox(
        height: 220,
        width: double.infinity,
        child: Image.network(
          car["image"],
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade300,
              child: const Center(
                child: Icon(
                  Icons.directions_car,
                  size: 60,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: Text(
                    car["name"],
                    style: const TextStyle(
                      fontSize: 22,
                      color: Color(0xff1E3C72),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF4CC),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "⭐ ${car["rating"]}",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffE8F0FE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                car["type"],
                style: const TextStyle(
                  color: Color(0xff1E3C72),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("👥 ${car["seats"]} Seats"),
                Text("⛽ ${car["fuel"]}"),
                Text("⚙ ${car["transmission"]}"),
              ],
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "PKR ${car["price"]}",
                      style: const TextStyle(
                        fontSize: 25,
                        color: Color(0xff1E3C72),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "/day",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1E3C72),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CarDetailsPage(
                          car: car,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.white,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}