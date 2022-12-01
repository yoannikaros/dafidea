import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import './widget/buttons.dart';
import './widget/form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
          Text('Sign Up & \nGrow Your Finance',
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
                //Full Name Input
                CustomFormField(tittle: 'Full Name'),

                SizedBox(
                  height: 16,
                ),
                //Email Input
                CustomFormField(tittle: 'Email Address'),

                SizedBox(
                  height: 16,
                ),

                //Password Input
                CustomFormField(
                  tittle: 'Password',
                  obscureText: true,
                ),

                SizedBox(
                  height: 30,
                ),

                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/home-page');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextButtom(
            title: 'Sign in',
            onPressed: () {
              Navigator.pushNamed(context, '/signin');
            },
          )
        ],
      ),
    );
  }
}
