import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../shared/theme.dart';
import '../widget/buttons.dart';
import '../widget/form.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

//
var user_id = TextEditingController();
var title = TextEditingController();
var body = TextEditingController();

final TextEditingController textEditingController = TextEditingController();

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    Future _onSubmit() async {
      try {
        return await http.post(
          Uri.parse("https://gorest.co.in/public/v2/users"),
          headers: {
            'Authorization':
                'Bearer 1fbcc0653b05027b134631f9addd6aa7b83e435a75eac0db06db98dd8779d9d2'
          },
          body: {
            "name": user_id.text,
            "email": title.text,
            "gender": body.text,
            "status": "active"
          },
        ).then((value) {
          var data = jsonDecode(value.body);

          print(data["message"]);
          Navigator.pushNamed(context, '/main-page');
        });
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 80,
          ),
          Text('Create your idea',
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
                //USer Id
                CustomFormField(
                  tittle: 'Full Name',
                  controller: user_id,
                ),

                SizedBox(
                  height: 16,
                ),
                //Title
                CustomFormField(
                  tittle: 'Email',
                  controller: title,
                ),

                SizedBox(
                  height: 16,
                ),
                //Title
                CustomFormField(
                  tittle: 'Gender',
                  controller: body,
                ),

                SizedBox(
                  height: 30,
                ),

                CustomFilledButton(
                  title: 'Add User',
                  onPressed: () {
                    _onSubmit();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextButtom(
            title: 'Back',
            onPressed: () {
              Navigator.pushNamed(context, '/main-page');
            },
          )
        ],
      ),
    );
  }
}
