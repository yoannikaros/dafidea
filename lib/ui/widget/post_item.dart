import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String name;
  final String email;
  final String gender;

  PostItem(this.name, this.email, this.gender);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 220,
        width: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.amber),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                gender,
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
