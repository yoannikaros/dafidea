import 'package:firebase_auth/firebase_auth.dart';

import '/shared/theme.dart';
import '/ui/widget/buttons.dart';
import '/ui/widget/form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(top: 100, bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img_logo_light.png'))),
          ),
          Text('Register & \nGrow Your Midset',
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold)),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Email Input
                CustomFormField(
                  tittle: 'Email Address',
                  controller: email,
                ),

                SizedBox(
                  height: 16,
                ),

                //Password Input
                CustomFormField(
                  tittle: 'Password',
                  obscureText: true,
                  controller: password,
                ),

                SizedBox(
                  height: 20,
                ),

                CustomFilledButton(
                  title: 'Register',
                  onPressed: () async {
                    if (FirebaseAuth.instance.currentUser == null) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email.text, password: password.text);

                        Navigator.pushNamed(context, '/main-page');
                      } on FirebaseAuthException catch (e) {}
                    } else {
                      Navigator.pushNamed(context, '/signin');
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextButtom(
            title: 'Login your account',
            onPressed: () {
              Navigator.pushNamed(context, '/signin');
            },
          )
        ],
      ),
    );
  }
}
