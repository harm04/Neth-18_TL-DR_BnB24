import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget CustomCard(BuildContext context, ImageProvider<Object> image,
    String title, String subtitle) {
  return Card(
    color: Colors.white,
    elevation: 20,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image(
            image: image,
            height: 90,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
                child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 48,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )),
          )
        ],
      ),
    ),
  );
}
