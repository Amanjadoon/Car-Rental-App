import 'package:flutter/material.dart';

import 'cars_page.dart';
import 'about_page.dart';
import 'booking_confirmation_page.dart';



class HomePage extends StatefulWidget {


  final VoidCallback onLogout;
  final String? selectedCar;

  const HomePage({

    super.key,

    required this.onLogout,
    this.selectedCar,
  });



  @override
  State<HomePage> createState()=>_HomePageState();


}




class _HomePageState extends State<HomePage>{


  String userEmail = "User";




  void _logout(){


    showDialog(

      context:context,

      builder:(context){


        return AlertDialog(


          shape:RoundedRectangleBorder(

            borderRadius:BorderRadius.circular(25),

          ),



          title:const Row(

            children:[

              Icon(
                Icons.logout,
                color:Colors.red,
              ),


              SizedBox(width:10),


              Text("Logout"),

            ],

          ),




          content:const Text(

            "Are you sure you want to logout?"

          ),




          actions:[



            TextButton(

              onPressed:(){

                Navigator.pop(context);

              },


              child:const Text("Cancel"),

            ),




            ElevatedButton(


              style:ElevatedButton.styleFrom(

                backgroundColor:Colors.red,

              ),



              onPressed:(){


                Navigator.pop(context);



                widget.onLogout();



                ScaffoldMessenger.of(context).showSnackBar(

                  const SnackBar(

                    content:Text(

                      "Logged out successfully"

                    ),

                    backgroundColor:Colors.green,

                  ),

                );


              },



              child:const Text(

                "Logout",

                style:TextStyle(

                  color:Colors.white,

                ),

              ),

            )


          ],


        );


      },

    );


  }







  Widget _navButton(

      String text,

      VoidCallback action

      ){

    return TextButton(

      onPressed:action,

      child:Text(

        text,

        style:const TextStyle(

          color:Colors.white,

          fontSize:14,

        ),

      ),

    );

  }







  @override
  Widget build(BuildContext context){


    return Scaffold(


      backgroundColor:const Color(0xffF5F7FA),



      appBar:AppBar(


        elevation:2,



        flexibleSpace:Container(

          decoration:const BoxDecoration(

            gradient:LinearGradient(

              colors:[

                Color(0xff1E3C72),

                Color(0xff2A5298),

              ],

            ),

          ),

        ),




        title:const Row(

          children:[


            Icon(

              Icons.directions_car,

              color:Colors.orange,

            ),


            SizedBox(width:8),


            Text(

              "CAR Rental",

              style:TextStyle(

                color:Colors.white,

                fontWeight:FontWeight.bold,

              ),

            )


          ],

        ),





        actions:[



          _navButton(

            "Home",

            (){},

          ),




          _navButton(

            "About",

            (){

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder:(_)=>const AboutPage(),

                ),

              );

            },

          ),




          _navButton(

            "Cars",

            (){

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder:(_)=>const CarsPage(),

                ),

              );

            },

          ),




          PopupMenuButton<String>(


            icon:const Icon(

              Icons.account_circle,

              color:Colors.white,

            ),



            onSelected:(value){


              if(value=="logout"){

                _logout();

              }


            },



            itemBuilder:(context)=>[


              const PopupMenuItem(

                value:"logout",

                child:Row(

                  children:[

                    Icon(

                      Icons.logout,

                      color:Colors.red,

                    ),

                    SizedBox(width:10),

                    Text("Logout"),

                  ],

                ),

              )

            ],

          )


        ],


      ),




      body:SingleChildScrollView(

        child:Column(

          children:[


            const SizedBox(height:20),

            _HeroSection(),


            const SizedBox(height:30),



            BookingSection(


              onRequireLogin:(){},
selectedCar: widget.selectedCar,

            ),



            const SizedBox(height:50),



            const _WhyChooseUs(),



            const SizedBox(height:50),



            const _Testimonials(),



            const SizedBox(height:50),



            const _Footer(),



          ],

        ),

      ),


    );


  }


}






// ================= HERO SECTION =================



class _HeroSection extends StatelessWidget {


  const _HeroSection();



  @override
  Widget build(BuildContext context){


    return SizedBox(


      height:520,


      width:double.infinity,



      child:Stack(


        children:[



          Positioned.fill(


            child:Image.network(


              'https://images.unsplash.com/photo-1549399542-7e3f8b79c341?w=1500',



              fit:BoxFit.cover,



              errorBuilder:(_,__,___){


                return Container(

                  color:const Color(0xff1E3C72),


                  child:const Icon(

                    Icons.directions_car,

                    size:100,

                    color:Colors.white,

                  ),

                );


              },


            ),

          ),




          Positioned.fill(


            child:Container(


              decoration:BoxDecoration(


                gradient:LinearGradient(


                  colors:[


                    Colors.black.withOpacity(0.7),

                    Colors.black.withOpacity(0.2),


                  ],


                ),


              ),


            ),


          ),





          Padding(


            padding:const EdgeInsets.only(

              left:50,

              top:100,

            ),



            child:Column(


              crossAxisAlignment:CrossAxisAlignment.start,


              children:[



                Container(


                  padding:const EdgeInsets.symmetric(

                    horizontal:15,

                    vertical:8,

                  ),



                  decoration:BoxDecoration(


                    color:Colors.orange,


                    borderRadius:BorderRadius.circular(25),


                  ),



                  child:const Text(


                    "Plan Your Trip Now",


                    style:TextStyle(

                      color:Colors.white,

                      fontWeight:FontWeight.bold,

                    ),


                  ),


                ),





                const SizedBox(height:20),





                const Text(


                  "SAVE BIG\nWITH OUR\nCAR RENTAL",



                  style:TextStyle(


                    color:Colors.white,


                    fontSize:45,


                    fontWeight:FontWeight.bold,


                    height:1.1,


                  ),



                ),





                const SizedBox(height:20),





                const Text(


                  "Affordable rates • Premium vehicles • 24/7 support",


                  style:TextStyle(


                    color:Colors.white70,


                    fontSize:15,


                  ),



                ),





                const SizedBox(height:30),





             Row(
  children: [

    ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CarsPage(),
          ),
        );
      },
      icon: const Icon(Icons.directions_car),
      label: const Text("Book Ride"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),

    const SizedBox(width: 15),

    OutlinedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AboutPage(),
          ),
        );
      },
      icon: const Icon(Icons.info_outline),
      label: const Text("Learn More"),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),

  ],
)



              ],


            ),


          )



        ],


      ),


    );


  }


}
// ================= BOOKING SECTION =================


class BookingSection extends StatefulWidget {


  final VoidCallback onRequireLogin;
final String? selectedCar;

  const BookingSection({

    super.key,

    required this.onRequireLogin,
this.selectedCar,
  });



  @override
  State<BookingSection> createState()=>_BookingSectionState();


}
class _BookingSectionState extends State<BookingSection>{

  late String car;

  String pickup="Pickup Location";

  String dropoff="Dropoff Location";


  String pickupDate="Pickup Date";

  String dropoffDate="Dropoff Date";

  final cars=[

    "Honda Civic",

    "Toyota Corolla",

    "Suzuki Alto",

    "BMW 3 Series",

    "Toyota Fortuner",

  ];

  final locations=[

    "Islamabad",

    "Abbottabad",

    "Lahore",

    "Karachi",

    "Peshawar",

    "Murree",

  ];
  @override
void initState() {
  super.initState();
  car = widget.selectedCar ?? "Select Car";
}

  void selectCar(){


    showModalBottomSheet(


      context:context,


      builder:(context){


        return ListView(


          children:cars.map((e){


            return ListTile(


              leading:const Icon(

                Icons.directions_car,

                color:Color(0xff1E3C72),

              ),


              title:Text(e),



              onTap:(){


                setState((){


                  car=e;


                });


                Navigator.pop(context);


              },


            );


          }).toList(),


        );


      },


    );


  }


  void selectLocation(bool isPickup){


    showModalBottomSheet(


      context:context,


      builder:(context){


        return ListView(


          children:locations.map((e){


            return ListTile(


              leading:const Icon(

                Icons.location_on,

                color:Color(0xff1E3C72),

              ),


              title:Text(e),



              onTap:(){


                setState((){


                  if(isPickup){


                    pickup=e;


                  }

                  else{


                    dropoff=e;


                  }


                });



                Navigator.pop(context);



              },


            );


          }).toList(),


        );


      },


    );


  }







  Future<void> pickDate(bool isPickup) async{


    final date=await showDatePicker(


      context:context,


      firstDate:DateTime.now(),


      lastDate:DateTime(2030),


      initialDate:DateTime.now(),


    );



    if(date!=null){


      setState((){


        String d="${date.day}-${date.month}-${date.year}";


        if(isPickup){


          pickupDate=d;


        }

        else{


          dropoffDate=d;


        }



      });



    }


  }

  Widget box(

      String text,

      IconData icon,

      VoidCallback tap

      ){


    return Expanded(


      child:GestureDetector(


        onTap:tap,


        child:Container(


          height:55,


          padding:const EdgeInsets.all(12),


          decoration:BoxDecoration(


            color:Colors.white,


            borderRadius:BorderRadius.circular(15),



            border:Border.all(

              color:Colors.grey.shade300,

            ),


          ),



          child:Row(


            children:[


              Icon(

                icon,

                color:Color(0xff1E3C72),

              ),



              const SizedBox(width:8),



              Expanded(


                child:Text(


                  text,


                  overflow:TextOverflow.ellipsis,


                ),


              )



            ],


          ),



        ),


      ),


    );


  }

  @override
  Widget build(BuildContext context){



    return Container(


      margin:const EdgeInsets.all(25),


      padding:const EdgeInsets.all(25),



      decoration:BoxDecoration(


        color:Colors.white,


        borderRadius:BorderRadius.circular(20),



        boxShadow:[


          BoxShadow(

            color:Colors.black.withOpacity(.1),

            blurRadius:20,

          )


        ],



      ),



      child:Column(


        crossAxisAlignment:CrossAxisAlignment.start,


        children:[



          const Text(


            "Book Your Ride",


            style:TextStyle(

              fontSize:25,

              fontWeight:FontWeight.bold,

              color:Color(0xff1E3C72),

            ),


          ),




          const SizedBox(height:20),




          Row(


            children:[


              box(

                car,

                Icons.directions_car,

                
                widget.selectedCar == null
     ? selectCar
     : () {},
              ),



              const SizedBox(width:10),



              box(

                pickup,

                Icons.location_on,

                ()=>selectLocation(true),

              ),



              const SizedBox(width:10),



              box(

                dropoff,

                Icons.flag,

                ()=>selectLocation(false),

              ),



            ],


          ),






          const SizedBox(height:15),




          Row(


            children:[



              box(

                pickupDate,

                Icons.calendar_month,

                ()=>pickDate(true),

              ),




              const SizedBox(width:10),




              box(

                dropoffDate,

                Icons.calendar_month,

                ()=>pickDate(false),

              ),



            ],



          ),





          const SizedBox(height:25),




          SizedBox(


            width:double.infinity,


            height:50,



            child:ElevatedButton(


onPressed:(){

if(
car=="Select Car" ||
pickup=="Pickup Location" ||
dropoff=="Dropoff Location" ||
pickupDate=="Pickup Date" ||
dropoffDate=="Dropoff Date"
){

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content:Text(
"Please fill all booking details"
),
backgroundColor:Colors.orange,
),
);

return;

}



showDialog(

context:context,

builder:(context){

return AlertDialog(

title:const Text(
"Confirm Booking"
),

content:const Text(
"Do you want to confirm this booking?"
),


actions:[


TextButton(

onPressed:(){

Navigator.pop(context);

ScaffoldMessenger.of(context)
.showSnackBar(
const SnackBar(
content:Text(
"Booking cancelled"
),
backgroundColor:Colors.red,
),
);

},

child:const Text("Cancel"),

),



ElevatedButton(

onPressed:(){

Navigator.pop(context);


Navigator.push(

context,

MaterialPageRoute(

builder:(_)=>BookingConfirmationPage(

car:car,

pickup:pickup,

dropoff:dropoff,

pickupDate:pickupDate,

dropoffDate:dropoffDate,

),

),

);


},

child:const Text("Confirm"),

)

],

);

}

);


},



              style:ElevatedButton.styleFrom(


                backgroundColor:const Color(0xff1E3C72),


                foregroundColor:Colors.white,


                shape:RoundedRectangleBorder(

                  borderRadius:BorderRadius.circular(15),

                ),

              ),



              child: const Text(
  "Book Now",
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),


            ),



          )


        ],


      ),


    );


  }


}
// ================= WHY CHOOSE US =================


class _WhyChooseUs extends StatelessWidget {

  const _WhyChooseUs();


  @override
  Widget build(BuildContext context) {


    final features = [

      {
        "icon": Icons.local_offer,
        "title": "Affordable Price",
        "desc": "Best rental rates with no hidden charges"
      },

      {
        "icon": Icons.car_rental,
        "title": "Premium Cars",
        "desc": "Clean, comfortable and reliable vehicles"
      },

      {
        "icon": Icons.headset_mic,
        "title": "24/7 Support",
        "desc": "Customer support whenever you need"
      },

      {
        "icon": Icons.map,
        "title": "Easy Booking",
        "desc": "Fast booking across Pakistan"
      },

    ];


    return Column(

      children: [


        const Text(

          "Why Choose Us?",

          style: TextStyle(

            fontSize: 30,

            fontWeight: FontWeight.bold,

            color: Color(0xff1E3C72),

          ),

        ),



        const SizedBox(height:8),



        const Text(

          "Making every journey comfortable and stress-free",

          style: TextStyle(

            color: Colors.grey,

            fontSize:14,

          ),

        ),



        const SizedBox(height:30),



        Padding(

          padding:
          const EdgeInsets.symmetric(horizontal:25),


          child: Column(

            children: features.map((item){


              return Container(

                margin:
                const EdgeInsets.only(bottom:15),


                padding:
                const EdgeInsets.all(16),



                decoration: BoxDecoration(

                  color: Colors.white,


                  borderRadius:
                  BorderRadius.circular(20),


                  boxShadow: [

                    BoxShadow(

                      color:
                      Colors.black.withOpacity(0.08),

                      blurRadius:15,

                      offset:
                      const Offset(0,6),

                    )

                  ],

                ),



                child: Row(

                  children: [


                    Container(

                      height:55,

                      width:55,


                      decoration: BoxDecoration(

                        gradient:
                        const LinearGradient(

                          colors:[

                            Color(0xff1E3C72),

                            Color(0xff2A5298),

                          ],

                        ),


                        borderRadius:
                        BorderRadius.circular(18),

                      ),


                      child: Icon(

                        item["icon"] as IconData,

                        color:Colors.white,

                        size:28,

                      ),

                    ),



                    const SizedBox(width:18),



                    Expanded(

                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,


                        children:[


                          Text(

                            item["title"] as String,

                            style:
                            const TextStyle(

                              fontSize:17,

                              fontWeight:
                              FontWeight.bold,

                              color:
                              Color(0xff1E3C72),

                            ),

                          ),



                          const SizedBox(height:5),



                          Text(

                            item["desc"] as String,

                            style:
                            const TextStyle(

                              color:Colors.grey,

                              fontSize:13,

                            ),

                          ),


                        ],

                      ),

                    ),



                    const Icon(

                      Icons.check_circle,

                      color:Colors.orange,

                      size:22,

                    )


                  ],

                ),

              );


            }).toList(),


          ),

        ),


      ],


    );


  }

}


// ================= TESTIMONIALS =================



class _Testimonials extends StatelessWidget {

const _Testimonials();


@override
Widget build(BuildContext context){


return Column(

children:[


const Text(

"What Our Customers Say",

style:TextStyle(

fontSize:30,

fontWeight:FontWeight.bold,

color:Color(0xff1E3C72),

),

),



const SizedBox(height:10),



const Text(

"Trusted by hundreds of happy customers",

style:TextStyle(

color:Colors.grey,

),

),



const SizedBox(height:25),



SizedBox(

height:210,


child:ListView(

scrollDirection:
Axis.horizontal,


padding:
const EdgeInsets.symmetric(horizontal:20),



children:[


testimonial(

"Ahmed Khan",

"Excellent service. Cars are clean and booking is very easy."

),


testimonial(

"Sara Malik",

"Affordable prices and professional support."

),


testimonial(

"Usman Ali",

"Best rental experience. Highly recommended."

),


],


),


)


],


);


}



Widget testimonial(String name,String review){


return Container(

width:300,


margin:
const EdgeInsets.only(right:20),


padding:
const EdgeInsets.all(22),



decoration:BoxDecoration(

gradient:
const LinearGradient(

colors:[

Color(0xff0F2027),
Color(0xff203A43),
Color(0xff2C5364),

],

),


borderRadius:
BorderRadius.circular(25),



boxShadow:[

BoxShadow(

color:
Colors.black.withOpacity(.15),

blurRadius:15,

)

],


),



child:Column(

crossAxisAlignment:
CrossAxisAlignment.start,


children:[



const Icon(

Icons.format_quote,

color:Colors.orange,

size:40,

),



Text(

review,

style:
const TextStyle(

color:Colors.white,

fontSize:15,

),

),



const Spacer(),



Row(

children:[


const CircleAvatar(

backgroundColor:
Colors.orange,

child:
Icon(

Icons.person,

color:Colors.white,

),

),



const SizedBox(width:12),



Text(

name,

style:
const TextStyle(

color:Colors.white,

fontWeight:
FontWeight.bold,

),

)

],


)

],

),


);


}


}

// ================= FOOTER =================

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.only(top: 40),

      padding: const EdgeInsets.only(
        top: 45,
        bottom: 25,
      ),

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1E3C72),
            Color(0xff2A5298),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),

            child: Wrap(
              spacing: 35,
              runSpacing: 30,
              alignment: WrapAlignment.center,

              children: [

                // Company
                footerColumn(
                  "🚗 CAR Rental",

                  "Your trusted car rental partner across Pakistan.\n"
                  "Affordable, reliable and available 24/7.",
                ),


                // Services
                footerColumn(
                  "Our Services",

                  "🚘 Car Rental\n"
                  "📅 Online Booking\n"
                  "🚗 Luxury Cars\n"
                  "🛡 Safe & Reliable Cars",
                ),


                // Contact
                footerColumn(
                  "Contact Us",

                  "📍 Abbottabad, Pakistan\n"
                  "📞 +92 300 1234567\n"
                  "✉ info@carrental.pk",
                ),


                // Social
                footerColumn(
                  "Follow Us",

                  "Facebook\n"
                  "Instagram\n"
                  "Twitter\n"
                  "LinkedIn",
                ),

              ],
            ),
          ),


          const SizedBox(height: 30),


          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white24,
          ),


          const SizedBox(height: 15),


          const Text(
            "© 2026 CAR Rental. All Rights Reserved.",

            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

        ],
      ),
    );
  }



  Widget footerColumn(String title, String text) {

    return SizedBox(

      width: 230,


      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,


        children: [

          Text(
            title,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),


          const SizedBox(height: 12),


          Text(
            text,

            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.7,
            ),
          ),

        ],
      ),
    );
  }
}