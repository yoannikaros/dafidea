import 'package:dafidea/shared/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [BuildProfile(context), logout()],
    );
  }

  final user = FirebaseAuth.instance.currentUser!;

  Widget BuildProfile(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      margin: EdgeInsets.only(top: 80),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, //Pisahkan Component antara kiri dan kanan
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                user.email!,
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget logout() {
    return GestureDetector(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushNamed(context, '/signin');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Log Out',
          style: greyTextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
