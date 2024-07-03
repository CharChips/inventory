import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inventory/src/features/authentication/controllers/emailcontroller.dart';
import 'package:inventory/src/features/authentication/screens/HomeScreen.dart';
<<<<<<< HEAD

=======
import 'package:inventory/main.dart';
import 'package:inventory/src/features/main_app/main_screen/main_screen.dart';
>>>>>>> 252de195b0cc9ab7fa7682d1777319d0ec2a6a33
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final supabase = Supabase.instance.client;

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

<<<<<<< HEAD
  final Emailcontroller emailGet=Get.put(Emailcontroller());

  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();

   Future<void> emailsignin()async{

    final response=await supabase.auth.signInWithPassword(password: passwordcontroller.text,
         email: emailcontroller.text
    
    );

    try {
  if(response.user!=null)
  
  {
      emailGet.emailget.value=emailcontroller.text;
      emailGet.mailchecker();
       emailcontroller.clear();
                            passwordcontroller.clear();
     
  }
} on Exception catch (e) {
  // TODO
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("You are not an ISA Member!"))
  );
}
   

  }
=======
  Future<void> emailsignin() async {
    final response = await supabase.auth.signInWithPassword(
        password: passwordcontroller.text, email: emailcontroller.text);

    try {
      if (response.user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()));
      }
    } on Exception catch (e) {
      // TODO
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("You are not an ISA Member!")));
    }
  }
>>>>>>> 252de195b0cc9ab7fa7682d1777319d0ec2a6a33

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
               TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: "Email",
                    hintText: "Email",
                    border: OutlineInputBorder()),
              ),
            
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordcontroller,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select One Option",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromARGB(
                                              110, 180, 170, 132)),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.mail_outline_rounded,
                                            size: 40,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Email",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium,
                                              ),
                                              Text("Verify using Email")
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ));
                  },
                  child: Text("Forgot Password")),
            ),
<<<<<<< HEAD
=======
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    emailsignin();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Homescreen()));
                  },
                  child: Text("LOGIN")),
            )
          ],
        ),
      ),
    );
  }
>>>>>>> 252de195b0cc9ab7fa7682d1777319d0ec2a6a33

               SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: Icon(Icons.email),
                          onPressed: () {
                            emailsignin();
                           
                          },
                          label: const Text("Log-In with Email"),
                        ),
                      ),
              
           
          ],
        ),
      ),
    );
  }
}
