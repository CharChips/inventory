import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory/src/features/authentication/screens/HomeScreen.dart';
import 'package:inventory/main.dart';
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

  final  supabase=Supabase.instance.client;

  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();

   Future<void> emailsignin()async{

    final response=await supabase.auth.signInWithPassword(password: passwordcontroller.text,
         email: emailcontroller.text
    
    );

  

    try {
  if(response.user!=null)
  
  {
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Homescreen()));
  }
} on Exception catch (e) {
  // TODO
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("You are not an ISA Member!"))
  );
}
   

  }

   

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
                    LoginBottomSheet(context);
                  },
                  child: Text("Forgot Password")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    emailsignin();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homescreen()));
                  },
                  child: Text("LOGIN")),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> LoginBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select One Option",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(110, 180, 170, 132)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.mail_outline_rounded,
                      size: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: Theme.of(context).textTheme.headlineMedium,
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
      ),
    );
  }
}
