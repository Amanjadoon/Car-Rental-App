import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(

        elevation: 0,

        flexibleSpace: Container(

          decoration: const BoxDecoration(

            gradient: LinearGradient(

              colors:[

                Color(0xff1E3C72),

                Color(0xff2A5298)

              ],

            ),

          ),

        ),

        title: const Text(

          "About Us",

          style: TextStyle(

            color: Colors.white,

            fontWeight: FontWeight.bold,

          ),

        ),

        iconTheme: const IconThemeData(

          color: Colors.white

        ),

      ),



      body: SingleChildScrollView(

        child: Column(

          children: [


            // ================= TOP BANNER =================


            Stack(

              children:[


                Image.network(

                  "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=1500",

                  height:320,

                  width:double.infinity,

                  fit:BoxFit.cover,

                ),



                Container(

                  height:320,

                  color:Colors.black.withOpacity(.55),

                ),



                Positioned.fill(

                  child:Column(

                    mainAxisAlignment:

                    MainAxisAlignment.center,

                    children:[


                      const Text(

                        "About CAR Rental",

                        style:TextStyle(

                          color:Colors.white,

                          fontSize:38,

                          fontWeight:FontWeight.bold,

                        ),

                      ),



                      const SizedBox(height:12),



                      const Text(

                        "Your trusted travel partner across Pakistan",

                        style:TextStyle(

                          color:Colors.white70,

                          fontSize:17,

                        ),

                      ),


                    ],

                  ),

                )


              ],

            ),



            const SizedBox(height:50),




            // ================= COMPANY SECTION =================



            Padding(

              padding:
              const EdgeInsets.symmetric(horizontal:25),


              child:Column(

                children:[


                  const Text(

                    "Who We Are",

                    style:TextStyle(

                      fontSize:30,

                      fontWeight:FontWeight.bold,

                      color:Color(0xff1E3C72),

                    ),

                  ),



                  const SizedBox(height:25),



                  Container(


                    padding:
                    const EdgeInsets.all(20),



                    decoration:BoxDecoration(

                      color:Colors.white,

                      borderRadius:
                      BorderRadius.circular(25),


                      boxShadow:[

                        BoxShadow(

                          color:Colors.black12,

                          blurRadius:12,

                          offset:
                          const Offset(0,5),

                        )

                      ],

                    ),



                    child:LayoutBuilder(

                      builder:(context,constraints){


                        if(constraints.maxWidth > 600){


                          return Row(

                            children:[



                              Expanded(

                                child:ClipRRect(

                                  borderRadius:
                                  BorderRadius.circular(20),


                                  child:Image.network(


                                    "https://images.unsplash.com/photo-1542362567-b07e54358753?w=1200",


                                    height:260,


                                    fit:BoxFit.cover,


                                  ),

                                ),

                              ),




                              const SizedBox(width:30),




                              Expanded(

                                child:_companyText(),

                              )


                            ],

                          );


                        }



                        else{


                          return Column(

                            children:[



                              ClipRRect(

                                borderRadius:
                                BorderRadius.circular(20),


                                child:Image.network(

                                  "https://images.unsplash.com/photo-1542362567-b07e54358753?w=1200",

                                  height:220,

                                  width:double.infinity,

                                  fit:BoxFit.cover,

                                ),

                              ),



                              const SizedBox(height:25),



                              _companyText(),

                            ],

                          );


                        }

                      },

                    ),

                  )


                ],

              ),

            ),



            const SizedBox(height:50),




            // ================= SERVICES =================



            const Text(

              "Our Services",

              style:TextStyle(

                color:Color(0xff1E3C72),

                fontSize:30,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:25),



            serviceCard(

              Icons.directions_car,

              "Self Drive Rental",

              "Choose your favorite car and enjoy complete freedom with our well-maintained rental vehicles."

            ),



            serviceCard(

              Icons.person,

              "Chauffeur Service",

              "Professional drivers available for comfortable and stress-free travelling."

            ),



            serviceCard(

              Icons.flight,

              "Airport Transfers",

              "Reliable pickup and drop services for airports with punctual and comfortable rides."

            ),
            serviceCard(

              Icons.business,

              "Corporate Rentals",

              "Special rental solutions for companies, meetings and business travel."

            ),



            serviceCard(

              Icons.event,

              "Event & Wedding Cars",

              "Premium vehicles available for weddings, events and special occasions."

            ),




            const SizedBox(height:40),




            // ================= CONTACT =================



            Container(

              margin:
              const EdgeInsets.all(25),


              padding:
              const EdgeInsets.all(30),



              decoration:BoxDecoration(


                gradient:
                const LinearGradient(


                  colors:[

                    Color(0xff1E3C72),

                    Color(0xff2A5298)

                  ],

                ),



                borderRadius:
                BorderRadius.circular(25),


              ),



              child:Column(

                children:[



                  const Text(

                    "Get In Touch",

                    style:TextStyle(

                      color:Colors.white,

                      fontSize:28,

                      fontWeight:FontWeight.bold,

                    ),

                  ),



                  const SizedBox(height:20),




                  contact(

                    Icons.location_on,

                    "Abbottabad, Pakistan",

                  ),



                  contact(

                    Icons.phone,

                    "+92 300 1234567",

                  ),



                  contact(

                    Icons.email,

                    "info@carrental.pk",

                  ),



                ],

              ),

            ),



            const SizedBox(height:30),


          ],

        ),

      ),

    );

  }







// ================= COMPANY TEXT =================


Widget _companyText(){


return Column(

crossAxisAlignment:
CrossAxisAlignment.start,


children:[



const Text(

"Pakistan's Trusted Car Rental Company",

style:TextStyle(

fontSize:24,

fontWeight:FontWeight.bold,

color:Color(0xff1E3C72),

),

),



const SizedBox(height:15),




const Text(

"CAR Rental provides reliable, affordable and comfortable "
"vehicles for every journey. We offer economy cars, SUVs "
"and luxury vehicles for family trips, business travel "
"and daily use.",


style:TextStyle(

color:Colors.grey,

fontSize:15,

height:1.7,

),

),




const SizedBox(height:15),




const Text(

"Our mission is to provide safe, clean and well-maintained "
"cars with excellent customer support across Pakistan.",


style:TextStyle(

color:Colors.grey,

fontSize:15,

height:1.7,

),

),




const SizedBox(height:20),




Row(

children:[


_companyStat("500+","Cars"),


const SizedBox(width:25),


_companyStat("20K+","Customers"),


const SizedBox(width:25),


_companyStat("13+","Cities"),



],

)


],

);

}






Widget _companyStat(String number,String title){


return Column(

crossAxisAlignment:
CrossAxisAlignment.start,


children:[


Text(

number,

style:const TextStyle(

color:Color(0xffFF9800),

fontSize:22,

fontWeight:FontWeight.bold,

),

),



Text(

title,

style:const TextStyle(

color:Colors.grey,

fontSize:13,

),

),



],

);

}







// ================= SERVICE CARD =================


Widget serviceCard(

IconData icon,

String title,

String text,

){


return Container(


margin:
const EdgeInsets.symmetric(

horizontal:25,

vertical:8,

),



padding:
const EdgeInsets.all(20),



decoration:BoxDecoration(

color:Colors.white,

borderRadius:
BorderRadius.circular(20),



boxShadow:[


BoxShadow(

color:Colors.black12,

blurRadius:10,

offset:
const Offset(0,4),

)

]


),



child:Row(

children:[



CircleAvatar(

radius:28,


backgroundColor:
const Color(0xffE8F0FE),


child:Icon(

icon,

color:Color(0xff1E3C72),

),

),




const SizedBox(width:20),




Expanded(

child:Column(

crossAxisAlignment:
CrossAxisAlignment.start,


children:[



Text(

title,

style:const TextStyle(

fontSize:18,

fontWeight:FontWeight.bold,

color:Color(0xff1E3C72),

),

),



const SizedBox(height:6),




Text(

text,

style:const TextStyle(

color:Colors.grey,

height:1.5,

),

),



],

),

),



],

),

);

}







// ================= CONTACT ROW =================


Widget contact(

IconData icon,

String text,

){


return Padding(

padding:
const EdgeInsets.symmetric(vertical:8),


child:Row(

children:[



Icon(

icon,

color:Colors.orange,

),




const SizedBox(width:15),




Text(

text,

style:const TextStyle(

color:Colors.white,

fontSize:16,

),

),



],

),

);


}

}