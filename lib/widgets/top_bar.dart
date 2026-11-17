import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFF242424),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'What do you want to play?',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        const CircleAvatar(
          backgroundColor: Color(0xFF333333),
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}