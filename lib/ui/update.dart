import 'dart:convert';
import 'dart:math';

import '/shared/theme.dart';
import '/ui/widget/buttons.dart';
import '/ui/widget/form.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateItem extends StatefulWidget {
  UpdateItem({
    required this.id,
  });
  var id;

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  var name = TextEditingController();
  var email = TextEditingController();
  var gender = TextEditingController();

  @override
  void initState() {
    super.initState();
    //in first time, this method will be executed
    _getData();
  }

  //Http to get detail data
  Future _getData() async {
    try {
      var yoan = widget.id;
      final response = await http.get(Uri.parse(
          //you have to take the ip address of your computer.
          //because using localhost will cause an error
          //get detail data with id
          "https://gorest.co.in/public/v2/users/$yoan"), headers: {
        'Authorization':
            'Bearer 1fbcc0653b05027b134631f9addd6aa7b83e435a75eac0db06db98dd8779d9d2'
      });

      // if response successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          name = TextEditingController(text: data['name']);
          email = TextEditingController(text: data['email']);
          gender = TextEditingController(text: data['gender']);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _onUpdate(context) async {
    try {
      var admin = widget.id;
      return await http.put(
        Uri.parse("https://gorest.co.in/public/v2/users/$admin"),
        headers: {
          'Authorization':
              'Bearer 1fbcc0653b05027b134631f9addd6aa7b83e435a75eac0db06db98dd8779d9d2'
        },
        body: {"name": name.text, "email": email.text, "gender": gender.text},
      ).then((value) {
        //print message after insert to database
        //you can improve this message with alert dialog
        var data = jsonDecode(value.body);
        print(data["message"]);

        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);

        Navigator.pop(context);
      });
    } catch (e) {
      print(e);
    }
  }

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
          Text('Update your data',
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
                //Password Input
                CustomFormField(
                  tittle: 'Name',
                  controller: name,
                ),
                SizedBox(
                  height: 16,
                ),

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
                  tittle: 'Gender',
                  controller: gender,
                ),

                SizedBox(
                  height: 20,
                ),

                CustomFilledButton(
                  title: 'Simpan',
                  onPressed: () {
                    _onUpdate(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
