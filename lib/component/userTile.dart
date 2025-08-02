import 'package:flutter/material.dart';


class Usertile extends StatefulWidget {
  final String text;
  final void Function()? onTap;

  const Usertile({super.key,required this.text,required this.onTap});

  @override
  State<Usertile> createState() => _UsertileState();
}

class _UsertileState extends State<Usertile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      ),
    );
  }
}
