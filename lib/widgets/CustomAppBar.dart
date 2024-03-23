import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconData AppBarIcon;
  final VoidCallback FunctionToDo;
  const CustomAppBar({
    super.key,
    required this.AppBarIcon,
    required this.FunctionToDo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: FunctionToDo,
            icon: Icon(
              AppBarIcon,
              color: Colors.white,
              size: 30,
              fill: 0.5,
            )),
        Image.asset(
          "assets/images/NoteLogo.png",
          width: 50,
          height: 50,
        )
      ],
    );
  }
}
