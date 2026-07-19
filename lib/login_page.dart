import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {

  final Function(String email) onLoginSuccess;


  const LoginPage({
    super.key,
    required this.onLoginSuccess,
  });


  @override
  State<LoginPage> createState() => _LoginPageState();

}


class _LoginPageState extends State<LoginPage> {

final FirebaseAuth auth = FirebaseAuth.instance;
  bool isHidden = true;
  bool isLoading = false;
  bool isSignUp = false;


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool validEmail(String email){

    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
    ).hasMatch(email);

  }




  void showMessage(
      String title,
      String text,
      Color color,
      IconData icon
      ){

    showDialog(

      context: context,

      builder:(context){

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),


          title: Row(

            children:[

              Icon(
                icon,
                color: color,
              ),

              const SizedBox(width:10),

              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color:color,
                    fontWeight:FontWeight.bold,
                  ),
                ),
              )

            ],

          ),


          content: Text(
            text,
            style: const TextStyle(
              fontSize:16,
            ),
          ),


          actions:[

            ElevatedButton(

              style:ElevatedButton.styleFrom(
                backgroundColor:color,
              ),

              onPressed:(){

                Navigator.pop(context);

              },

              child:const Text(
                "OK",
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
    void submit() async {


    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text.trim();



    if(isSignUp && name.isEmpty){

      showMessage(
        "Name Required",
        "Please enter your full name.",
        Colors.orange,
        Icons.person,
      );

      return;

    }




    if(email.isEmpty){

      showMessage(
        "Email Required",
        "Please enter your email address.",
        Colors.orange,
        Icons.email,
      );

      return;

    }




    if(!validEmail(email)){


      showMessage(
        "Invalid Email",
        "Please enter a valid email address.",
        Colors.red,
        Icons.error,
      );

      return;

    }




    if(password.length < 8){


      showMessage(
        "Weak Password",
        "Password must be minimum 8 characters long.",
        Colors.red,
        Icons.lock,
      );

      return;

    }




    setState((){

      isLoading = true;

    });



    await Future.delayed(
      const Duration(seconds:1),
    );



    setState((){

      isLoading = false;

    });





try {

  if(isSignUp){

    UserCredential user =
        await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );


    showMessage(
      "Account Created",
      "Your account has been created successfully.",
      Colors.green,
      Icons.check_circle,
    );


    widget.onLoginSuccess(user.user!.email!);


  }

  else{


    UserCredential user =
        await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );


    showMessage(
      "Login Successful",
      "Welcome back!",
      Colors.green,
      Icons.login,
    );


    widget.onLoginSuccess(user.user!.email!);


  }



  Future.delayed(
    const Duration(seconds:1),
    (){
      Navigator.pop(context);
    },
  );


}


on FirebaseAuthException catch(e){


  String message="Something went wrong";


  if(e.code=="email-already-in-use"){

    message="This email is already registered.";

  }

  else if(e.code=="user-not-found"){

    message="No account found with this email.";

  }

  else if(e.code=="wrong-password"){

    message="Incorrect password.";

  }

  else if(e.code=="invalid-email"){

    message="Invalid email address.";

  }


  showMessage(
    "Authentication Failed",
    message,
    Colors.red,
    Icons.error,
  );


}


  }
  @override
Widget build(BuildContext context) {

  return Scaffold(

    body: Container(

      decoration: const BoxDecoration(

        gradient: LinearGradient(

          colors:[
            Color.fromARGB(255, 252, 252, 252),
            Color.fromARGB(255, 252, 252, 252),
          ],

          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

        ),

      ),



      child: Center(

        child: SingleChildScrollView(

          child: Container(

            width:380,

            margin:const EdgeInsets.all(20),


            padding:const EdgeInsets.all(25),



            decoration:BoxDecoration(

              color:Colors.white,

              borderRadius:BorderRadius.circular(30),


              boxShadow:[

                BoxShadow(

                  color:Colors.black.withOpacity(0.25),

                  blurRadius:25,

                  offset:const Offset(0,15),

                )

              ],

            ),



            child:Column(

              mainAxisSize:MainAxisSize.min,

              children:[



                Container(

                  height:100,

                  width:100,


                  decoration:BoxDecoration(

                    shape:BoxShape.circle,


                    gradient:const LinearGradient(

                      colors:[

                        Color(0xff1E3C72),
                        Color(0xff2A5298),

                      ],

                    ),


                  ),



                  child:const Icon(

                    Icons.directions_car,

                    color:Colors.white,

                    size:55,

                  ),

                ),




                const SizedBox(height:25),




                Text(

                  isSignUp

                  ?"Create Account"

                  :"Welcome Back",



                  style:const TextStyle(

                    fontSize:28,

                    fontWeight:FontWeight.bold,

                    color:Color(0xff1E3C72),

                  ),

                ),




                const SizedBox(height:8),




                Text(

                  isSignUp

                  ?"Register to book your favorite cars"

                  :"Login to manage your bookings",



                  style:const TextStyle(

                    color:Colors.grey,

                  ),

                ),




                const SizedBox(height:30),




                if(isSignUp)

                _input(

                  nameController,

                  "Full Name",

                  Icons.person,

                ),



                if(isSignUp)

                const SizedBox(height:15),




                _input(

                  emailController,

                  "Email Address",

                  Icons.email,

                ),




                const SizedBox(height:15),





                TextField(

                  controller:passwordController,

                  obscureText:isHidden,



                  decoration:InputDecoration(

                    labelText:"Password",



                    prefixIcon:const Icon(

                      Icons.lock,

                      color:Color(0xff1E3C72),

                    ),



                    suffixIcon:IconButton(

                      icon:Icon(

                        isHidden

                        ?Icons.visibility_off

                        :Icons.visibility,

                      ),



                      onPressed:(){

                        setState((){

                          isHidden=!isHidden;

                        });

                      },

                    ),




                    filled:true,

                    fillColor:const Color(0xffF5F7FA),




                    border:OutlineInputBorder(

                      borderRadius:BorderRadius.circular(18),

                      borderSide:BorderSide.none,

                    ),



                  ),

                ),




                const SizedBox(height:25),




                SizedBox(

                  height:55,

                  width:double.infinity,



                  child:ElevatedButton(

                    onPressed:

                    isLoading

                    ?null

                    :submit,



                    style:ElevatedButton.styleFrom(

                      backgroundColor:

                      const Color(0xff1E3C72),



                      shape:RoundedRectangleBorder(

                        borderRadius:BorderRadius.circular(18),

                      ),

                    ),




                    child:isLoading


                    ?const CircularProgressIndicator(

                      color:Colors.white,

                    )


                    :Text(

                      isSignUp

                      ?"CREATE ACCOUNT"

                      :"LOGIN",



                      style:const TextStyle(

                        color:Colors.white,

                        fontWeight:FontWeight.bold,

                        fontSize:16,

                      ),

                    ),

                  ),

                ),




                const SizedBox(height:20),





                GestureDetector(

                  onTap:(){


                    setState((){

                      isSignUp=!isSignUp;


                      emailController.clear();

                      passwordController.clear();

                      nameController.clear();


                    });


                  },


                  child:RichText(

                    text:TextSpan(

                      children:[


                        TextSpan(

                          text:isSignUp

                          ?"Already have account? "

                          :"Don't have account? ",


                          style:const TextStyle(

                            color:Colors.grey,

                          ),

                        ),



                        TextSpan(

                          text:isSignUp

                          ?"LOGIN"

                          :"SIGN UP",


                          style:const TextStyle(

                            color:Color(0xff1E3C72),

                            fontWeight:FontWeight.bold,

                          ),

                        )


                      ],

                    ),

                  ),

                )

              ],

            ),

          ),

        ),

      ),

    ),

  );

}
Widget _input(

    TextEditingController controller,

    String text,

    IconData icon,

){

  return TextField(

    controller:controller,


    decoration:InputDecoration(

      labelText:text,


      prefixIcon:Icon(

        icon,

        color:const Color(0xff1E3C72),

      ),



      filled:true,

      fillColor:const Color(0xffF5F7FA),




      border:OutlineInputBorder(

        borderRadius:BorderRadius.circular(18),

        borderSide:BorderSide.none,

      ),




      focusedBorder:OutlineInputBorder(

        borderRadius:BorderRadius.circular(18),

        borderSide:const BorderSide(

          color:Color(0xff1E3C72),

          width:2,

        ),

      ),


    ),


  );


}





@override
void dispose(){


  emailController.dispose();

  passwordController.dispose();

  nameController.dispose();


  super.dispose();

}
}