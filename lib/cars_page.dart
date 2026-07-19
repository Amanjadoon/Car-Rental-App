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
  Future<void> checkAvailability(DocumentSnapshot doc) async {

  final data = doc.data() as Map<String,dynamic>;


  if(data["available"] == false &&
     data["availableUntil"] != null) {


    DateTime until = DateTime.parse(
      data["availableUntil"],
    );


    if(DateTime.now().isAfter(until)) {


      await doc.reference.update({

        "available": true,

        "availableUntil": null,

      });


    }

  }

}

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

List<Map<String, dynamic>> filteredCars =
    snapshot.data!.docs.map((doc) {

  checkAvailability(doc);

  Map<String, dynamic> car =
      doc.data() as Map<String, dynamic>;

  car["id"] = doc.id;

  return car;

}).where((car) =>
    selectedFilter == "All" ||
    car["type"] == selectedFilter
).toList();

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
                            bool isAvailable = car["available"] ?? true;
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
          car["image"]?.toString() ?? "",
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
Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 5,
  ),

  decoration: BoxDecoration(
    color: isAvailable
        ? Colors.green
        : Colors.red,

    borderRadius: BorderRadius.circular(20),
  ),

  child: Text(
    isAvailable
        ? "Available"
        : "Booked",

    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
  ),
),

const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    car["name"]?.toString() ?? "Unknown",
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
                    "⭐ ${car["rating"]?.toString() ?? "0"}",
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
                car["type"]?.toString() ?? "Car",
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
                Text("👥 ${car["seats"]?.toString() ?? "N/A"} Seats"),
                Text("⛽ ${car["fuel"]?.toString() ?? "N/A"}"),
                Text("⚙ ${car["transmission"]?.toString() ?? "N/A"}"),
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
                      "PKR ${car["price"]?.toString() ?? "0"}",
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

    if (!isAvailable) {

ScaffoldMessenger.of(context).showSnackBar(

  SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(20),
    duration: const Duration(seconds: 3),

    backgroundColor: Colors.transparent,

    content: Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xffD32F2F),
            Color(0xffFF5252),
          ],
        ),

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.event_busy,
              color: Colors.white,
            ),
          ),

          const SizedBox(width:15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisSize: MainAxisSize.min,

              children: [

                const Text(
                  "Car Not Available",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height:5),

                Text(
                  "Booked until ${car["availableUntil"]}",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize:14,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    ),
  ),

);

      return;
    }


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