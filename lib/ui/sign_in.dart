import '/shared/theme.dart';
import '/ui/widget/buttons.dart';
import '/ui/widget/form.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
          Text('Sign In & \nGrow Your Finance',
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
                CustomFormField(tittle: 'Email Address'),

                SizedBox(
                  height: 16,
                ),

                //Password Input
                CustomFormField(
                  tittle: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 8,
                ),

                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: blueTextStyle,
                    )),

                SizedBox(
                  height: 8,
                ),

                CustomFilledButton(
                  title: 'Sign in',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextButtom(
            title: 'Create New Account',
            onPressed: () {
              Navigator.pushNamed(context, '/Sign-up');
            },
          )
        ],
      ),
    );
  }
}
