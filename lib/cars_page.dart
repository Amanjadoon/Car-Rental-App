import 'package:flutter/material.dart';
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

  final List<Map<String, dynamic>> cars = [
    // ===== PART 1B =====
    {
  "name": "Toyota Corolla",
  "type": "Sedan",
  "model": "2023",
  "price": 5000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.8,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1800cc",
  "mileage": "15 km/l",
  "color": "White",
  "features": "ABS, Airbags, Bluetooth, Rear Camera",
  "image":
      "https://images.unsplash.com/photo-1590362891991-f776e747a588?w=700",
},

{
  "name": "Honda Civic",
  "type": "Sedan",
  "model": "2022",
  "price": 6000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.7,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1800cc",
  "mileage": "14 km/l",
  "color": "Black",
  "features": "Sunroof, ABS, Cruise Control",
  "image":
      "https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=700",
},

{
  "name": "Toyota Yaris",
  "type": "Sedan",
  "model": "2021",
  "price": 4500,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.5,
  "ac": "Working",
  "condition": "Good",
  "engine": "1500cc",
  "mileage": "16 km/l",
  "color": "Silver",
  "features": "Bluetooth, Navigation, Safety Sensors",
  "image":
      "https://images.unsplash.com/photo-1542362567-b07e54358753?w=700",
},

{
  "name": "Hyundai Elantra",
  "type": "Sedan",
  "model": "2023",
  "price": 7000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.9,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1600cc",
  "mileage": "17 km/l",
  "color": "Blue",
  "features": "Sunroof, Smart Key, Touch Display",
  "image":
      "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=700",
},

{
  "name": "Toyota Prius",
  "type": "Sedan",
  "model": "2020",
  "price": 8000,
  "seats": 5,
  "fuel": "Hybrid",
  "transmission": "Automatic",
  "rating": 4.8,
  "ac": "Working",
  "condition": "Good",
  "engine": "1800cc Hybrid",
  "mileage": "22 km/l",
  "color": "White",
  "features": "Hybrid System, Parking Sensors",
  "image":
      "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=700",
},

{
  "name": "Suzuki Swift",
  "type": "Sedan",
  "model": "2022",
  "price": 3500,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Manual",
  "rating": 4.3,
  "ac": "Working",
  "condition": "Good",
  "engine": "1200cc",
  "mileage": "18 km/l",
  "color": "Red",
  "features": "ABS, Power Windows",
  "image":
      "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=700",
},

{
  "name": "KIA Cerato",
  "type": "Sedan",
  "model": "2023",
  "price": 7500,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.7,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1600cc",
  "mileage": "15 km/l",
  "color": "Grey",
  "features": "Sunroof, Leather Seats",
  "image":
      "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=700",
},

{
  "name": "Honda City",
  "type": "Sedan",
  "model": "2021",
  "price": 4500,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.4,
  "ac": "Working",
  "condition": "Good",
  "engine": "1500cc",
  "mileage": "17 km/l",
  "color": "White",
  "features": "Camera, Bluetooth",
  "image":
      "https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=700",
},

{
  "name": "MG 5",
  "type": "Sedan",
  "model": "2023",
  "price": 6500,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.6,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1500cc",
  "mileage": "14 km/l",
  "color": "Black",
  "features": "Large Screen, Sunroof",
  "image":
      "https://images.unsplash.com/photo-1555215695-3004980ad54e?w=700",
},

{
  "name": "Nissan Sunny",
  "type": "Sedan",
  "model": "2020",
  "price": 4000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.2,
  "ac": "Not Working",
  "condition": "Average",
  "engine": "1500cc",
  "mileage": "13 km/l",
  "color": "Silver",
  "features": "Power Steering, Airbags",
  "image":
      "https://images.unsplash.com/photo-1542362567-b07e54358753?w=700",
},
// ================= SUV CARS =================

{
  "name": "Toyota Fortuner",
  "type": "SUV",
  "model": "2024",
  "price": 12000,
  "seats": 7,
  "fuel": "Diesel",
  "transmission": "Automatic",
  "rating": 4.9,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "2800cc",
  "mileage": "12 km/l",
  "color": "Black",
  "features": "4x4, Sunroof, Leather Seats, Cruise Control",
  "image":
      "https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=700",
},

{
  "name": "Honda BR-V",
  "type": "SUV",
  "model": "2023",
  "price": 8000,
  "seats": 7,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.6,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1500cc",
  "mileage": "14 km/l",
  "color": "White",
  "features": "ABS, Airbags, Rear Camera",
  "image":
      "https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=700",
},

{
  "name": "KIA Sportage",
  "type": "SUV",
  "model": "2023",
  "price": 10000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.8,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "2000cc",
  "mileage": "11 km/l",
  "color": "Grey",
  "features": "AWD, Sunroof, Smart Display",
  "image":
      "https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=700",
},

{
  "name": "Hyundai Tucson",
  "type": "SUV",
  "model": "2022",
  "price": 9500,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.7,
  "ac": "Working",
  "condition": "Good",
  "engine": "2000cc",
  "mileage": "12 km/l",
  "color": "Blue",
  "features": "360 Camera, Leather Seats",
  "image":
      "https://images.unsplash.com/photo-1542362567-b07e54358753?w=700",
},

{
  "name": "MG HS",
  "type": "SUV",
  "model": "2023",
  "price": 11000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.8,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1500cc Turbo",
  "mileage": "13 km/l",
  "color": "Red",
  "features": "Panoramic Roof, Adaptive Cruise",
  "image":
      "https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=700",
},

{
  "name": "Toyota Prado",
  "type": "SUV",
  "model": "2020",
  "price": 18000,
  "seats": 7,
  "fuel": "Diesel",
  "transmission": "Automatic",
  "rating": 5.0,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "3000cc",
  "mileage": "10 km/l",
  "color": "White",
  "features": "4x4, Leather Interior, Navigation",
  "image":
      "https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=700",
},

{
  "name": "Nissan X-Trail",
  "type": "SUV",
  "model": "2022",
  "price": 9000,
  "seats": 7,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.5,
  "ac": "Working",
  "condition": "Good",
  "engine": "2500cc",
  "mileage": "12 km/l",
  "color": "Silver",
  "features": "Parking Sensors, Bluetooth",
  "image":
      "https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=700",
},

{
  "name": "Suzuki Vitara",
  "type": "SUV",
  "model": "2021",
  "price": 7000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.4,
  "ac": "Working",
  "condition": "Good",
  "engine": "1600cc",
  "mileage": "15 km/l",
  "color": "Blue",
  "features": "ABS, Cruise Control",
  "image":
      "https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=700",
},

{
  "name": "Haval H6",
  "type": "SUV",
  "model": "2024",
  "price": 13000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.9,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1500cc Turbo",
  "mileage": "14 km/l",
  "color": "Black",
  "features": "ADAS, Sunroof, Digital Display",
  "image":
      "https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=700",
},

{
  "name": "Jeep Wrangler",
  "type": "SUV",
  "model": "2022",
  "price": 25000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 5.0,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "3600cc",
  "mileage": "9 km/l",
  "color": "Green",
  "features": "4x4, Off Road Mode, Removable Roof",
  "image":
      "https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=700",
},
// ================= HATCHBACK CARS =================

{
  "name": "Suzuki Alto",
  "type": "Hatchback",
  "model": "2023",
  "price": 2500,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.5,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "660cc",
  "mileage": "18 km/l",
  "color": "White",
  "features": "Power Windows, Airbags, Bluetooth",
  "image": "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=700",
},

{
  "name": "Suzuki Wagon R",
  "type": "Hatchback",
  "model": "2022",
  "price": 3000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.3,
  "ac": "Working",
  "condition": "Good",
  "engine": "1000cc",
  "mileage": "16 km/l",
  "color": "Silver",
  "features": "ABS, USB, Power Steering",
  "image": "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=700",
},

{
  "name": "Suzuki Cultus",
  "type": "Hatchback",
  "model": "2023",
  "price": 3500,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.6,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1000cc",
  "mileage": "17 km/l",
  "color": "Blue",
  "features": "Bluetooth, Airbags, Touch Display",
  "image": "https://images.unsplash.com/photo-1542362567-b07e54358753?w=700",
},

{
  "name": "Toyota Vitz",
  "type": "Hatchback",
  "model": "2021",
  "price": 4000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.7,
  "ac": "Working",
  "condition": "Good",
  "engine": "1300cc",
  "mileage": "18 km/l",
  "color": "Red",
  "features": "Push Start, Camera, ABS",
  "image": "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=700",
},

{
  "name": "Honda Fit",
  "type": "Hatchback",
  "model": "2022",
  "price": 4500,
  "seats": 5,
  "fuel": "Hybrid",
  "transmission": "Automatic",
  "rating": 4.8,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1500cc Hybrid",
  "mileage": "22 km/l",
  "color": "White",
  "features": "Hybrid System, Navigation",
  "image": "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=700",
},

{
  "name": "KIA Picanto",
  "type": "Hatchback",
  "model": "2023",
  "price": 4000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.4,
  "ac": "Working",
  "condition": "Good",
  "engine": "1000cc",
  "mileage": "15 km/l",
  "color": "Yellow",
  "features": "Bluetooth, Rear Camera",
  "image": "https://images.unsplash.com/photo-1542362567-b07e54358753?w=700",
},

{
  "name": "Daihatsu Mira",
  "type": "Hatchback",
  "model": "2021",
  "price": 2800,
  "seats": 4,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.2,
  "ac": "Not Working",
  "condition": "Average",
  "engine": "660cc",
  "mileage": "20 km/l",
  "color": "Silver",
  "features": "Power Steering, Airbags",
  "image": "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=700",
},

{
  "name": "Toyota Aqua",
  "type": "Hatchback",
  "model": "2022",
  "price": 5000,
  "seats": 5,
  "fuel": "Hybrid",
  "transmission": "Automatic",
  "rating": 4.8,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "1500cc Hybrid",
  "mileage": "25 km/l",
  "color": "Green",
  "features": "Eco Mode, Smart Key",
  "image": "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=700",
},

{
  "name": "Nissan Dayz",
  "type": "Hatchback",
  "model": "2020",
  "price": 2500,
  "seats": 4,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.1,
  "ac": "Working",
  "condition": "Good",
  "engine": "660cc",
  "mileage": "19 km/l",
  "color": "Black",
  "features": "ABS, Bluetooth",
  "image": "https://images.unsplash.com/photo-1542362567-b07e54358753?w=700",
},

{
  "name": "Mitsubishi EK Wagon",
  "type": "Hatchback",
  "model": "2021",
  "price": 3000,
  "seats": 4,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.3,
  "ac": "Working",
  "condition": "Good",
  "engine": "660cc",
  "mileage": "18 km/l",
  "color": "Blue",
  "features": "Camera, Power Windows",
  "image": "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=700",
},
// ================= LUXURY CARS =================

{
  "name": "BMW 3 Series",
  "type": "Luxury",
  "model": "2024",
  "price": 20000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 5.0,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "2000cc Turbo",
  "mileage": "13 km/l",
  "color": "Black",
  "features": "Sunroof, Leather Seats, Digital Cockpit",
  "image": "https://images.unsplash.com/photo-1555215695-3004980ad54e?w=700",
},

{
  "name": "Audi A4",
  "type": "Luxury",
  "model": "2023",
  "price": 22000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.9,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "2000cc",
  "mileage": "12 km/l",
  "color": "White",
  "features": "Virtual Cockpit, Premium Sound",
  "image": "https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=700",
},

{
  "name": "Mercedes C Class",
  "type": "Luxury",
  "model": "2024",
  "price": 30000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 5.0,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "2000cc",
  "mileage": "12 km/l",
  "color": "Silver",
  "features": "Ambient Lighting, Leather Interior",
  "image": "https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=700",
},

{
  "name": "BMW X5",
  "type": "Luxury",
  "model": "2023",
  "price": 35000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 5.0,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "3000cc",
  "mileage": "10 km/l",
  "color": "Black",
  "features": "AWD, Luxury Interior, Sunroof",
  "image": "https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=700",
},

{
  "name": "Range Rover Evoque",
  "type": "Luxury",
  "model": "2022",
  "price": 40000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 5.0,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "2000cc",
  "mileage": "11 km/l",
  "color": "Black",
  "features": "4x4, Panoramic Roof",
  "image": "https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=700",
},

{
  "name": "Porsche Cayenne",
  "type": "Luxury",
  "model": "2024",
  "price": 45000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 5.0,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "3000cc Turbo",
  "mileage": "9 km/l",
  "color": "Grey",
  "features": "Sport Mode, Premium Sound, Panoramic Roof",
  "image": "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=700",
},

{
  "name": "Lexus ES 350",
  "type": "Luxury",
  "model": "2023",
  "price": 28000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.9,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "3500cc",
  "mileage": "11 km/l",
  "color": "White",
  "features": "Luxury Seats, Adaptive Cruise, Navigation",
  "image": "https://images.unsplash.com/photo-1555215695-3004980ad54e?w=700",
},

{
  "name": "Mercedes E Class",
  "type": "Luxury",
  "model": "2024",
  "price": 50000,
  "seats": 5,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 5.0,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "2000cc Turbo",
  "mileage": "12 km/l",
  "color": "Black",
  "features": "Massage Seats, Ambient Lighting, Sunroof",
  "image": "https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=700",
},

{
  "name": "Audi Q7",
  "type": "Luxury",
  "model": "2023",
  "price": 42000,
  "seats": 7,
  "fuel": "Petrol",
  "transmission": "Automatic",
  "rating": 4.9,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "3000cc",
  "mileage": "10 km/l",
  "color": "Blue",
  "features": "Quattro AWD, Virtual Cockpit, Premium Audio",
  "image": "https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=700",
},

{
  "name": "Tesla Model S",
  "type": "Luxury",
  "model": "2024",
  "price": 60000,
  "seats": 5,
  "fuel": "Electric",
  "transmission": "Automatic",
  "rating": 5.0,
  "ac": "Working",
  "condition": "Excellent",
  "engine": "Electric Motor",
  "mileage": "450 km Range",
  "color": "Red",
  "features": "Autopilot, Touch Screen, Fast Charging",
  "image": "https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=700",
},

  ];

  @override
  Widget build(BuildContext context) {
    final filteredCars = selectedFilter == "All"
        ? cars
        : cars.where((car) => car["type"] == selectedFilter).toList();

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
                        foregroundColor:
                            active ? Colors.white : const Color(0xff1E3C72),
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
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        /// IMAGE
                        SizedBox(
                          height: 220,
                          width: double.infinity,
                          child: Image.network(
                            car["image"],
                            fit: BoxFit.cover,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    padding:
                                        const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
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
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              const SizedBox(height: 10),

                              Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffE8F0FE),
                                  borderRadius:
                                      BorderRadius.circular(8),
                                ),
                                child: Text(
                                  car["type"],
                                  style: const TextStyle(
                                    color: Color(0xff1E3C72),
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 18),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("👥 ${car["seats"]} Seats"),
                                  Text("⛽ ${car["fuel"]}"),
                                  Text("⚙ ${car["transmission"]}"),
                                ],
                              ),

                              const SizedBox(height: 25),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        "PKR ${car["price"]}",
                                        style: const TextStyle(
                                          fontSize: 25,
                                          color: Color(0xff1E3C72),
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),

                                      const Text(
                                        "/day",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      )
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
)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
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
