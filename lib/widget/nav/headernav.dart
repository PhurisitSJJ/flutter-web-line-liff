import 'package:flutter/material.dart';

class HeaderNav extends StatefulWidget {
  const HeaderNav({super.key, required this.text, required this.selected});

  final String text;
  final bool selected;

  @override
  State<HeaderNav> createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: const TextStyle(color: Colors.white, fontSize: 16)
        ),
        widget.selected ? const SizedBox(height: 5.0,) : const SizedBox(),
        widget.selected ? const CircleAvatar(backgroundColor: Colors.white, radius: 2.0,) : const SizedBox(),
      ],
    );
  }
}
