import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inventory/src/features/main_app/main_screen/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:inventory/src/features/authentication/controllers/emailcontroller.dart';
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

  final Emailcontroller emailGet = Get.put(Emailcontroller());

  Future<void> emailsignin() async {
    final response = await supabase.auth.signInWithPassword(
        password: passwordcontroller.text, email: emailcontroller.text);

    try {
      if (response.user != null) {
        emailGet.emailget.value = emailcontroller.text;
        emailGet.mailchecker();
        emailcontroller.clear();
        passwordcontroller.clear();
         final session = response.session;
      await supabase.auth.setSession(session as String);
        final prefs= await SharedPreferences.getInstance();
        prefs.setString('email', emailGet.emailget.value);
        
      }
    } on Exception catch (e) {
      // TODO
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("You are not an ISA Member!")));
    }
  }

  @override
void initState() {
  super.initState();

  // Retrieve the current authentication session
  supabase.auth.refreshSession().then((session) {
    if (session != null) {
      // If the session is valid, authenticate the user
      emailGet.emailget.value = session.user!.email!;
      emailGet.mailchecker();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreen()));
    }
  });
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
