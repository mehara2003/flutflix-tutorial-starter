import 'package:flutter/material.dart';

class backButton extends StatelessWidget {
  const backButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF23272E),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded
        ),
    
      ),
    );
  }
}