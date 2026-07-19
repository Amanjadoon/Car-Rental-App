import 'package:flutter/material.dart';
import 'home_page.dart';
class CarDetailsPage extends StatelessWidget {
  final Map<String, dynamic> car;

  const CarDetailsPage({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        backgroundColor: const Color(0xff1E3C72),
        elevation: 0,
        title: const Text(
          "Car Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.12),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// IMAGE
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Image.network(
                    car["image"],
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// TITLE + RATING
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Text(
                              car["name"],
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1E3C72),
                              ),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFF4CC),
                              borderRadius:
                                  BorderRadius.circular(30),
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

                      const SizedBox(height: 20),

                      /// TYPE
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE8F0FE),
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Text(
                          car["type"],
                          style: const TextStyle(
                            color: Color(0xff1E3C72),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// PRICE
                      Text(
                        "PKR ${car["price"]}/day",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1E3C72),
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// DETAILS GRID
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 2,
                        children: [

                          detailCard("Model", car["model"]),
                          detailCard("Condition", car["condition"]),
                          detailCard("AC", car["ac"]),
                          detailCard("Engine", car["engine"]),
                          detailCard("Fuel", car["fuel"]),
                          detailCard(
                              "Transmission",
                              car["transmission"]),
                          detailCard(
                              "Seats",
                              "${car["seats"]}"),
                          detailCard(
                              "Mileage",
                              car["mileage"]),
                          detailCard("Color", car["color"]),
                        ],
                      ),

                      const SizedBox(height: 30),

                      /// FEATURES
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xffEEF4FF),
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            const Text(
                              "Features",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1E3C72),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "✓ ${car["features"]}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      /// BUTTON
                      Center(
                        child: SizedBox(
                          width: 260,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xff1E3C72),
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => HomePage(
        onLogout: () {},
        selectedCar: car["name"],
      ),
    ),
  );
},
                            child: const Text(
                              "Book This Car",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffF8FAFF),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xffE5EAF5)),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [

          Text(
            title,
            style: const TextStyle(
              color: Color(0xff1E3C72),
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}