import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/text_constants.dart';

class AddProfile extends StatelessWidget {
  const AddProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          width: 62,
          height: 62,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 50,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
         TextConstants.addProfileButton,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}