import 'package:calimba_application/services/play_audio.dart';
import 'package:flutter/material.dart';

class KalimbaString extends StatefulWidget {
  final String number;
  final double height;
  final double width;

  final int dotNumber; // Dot sayısını temsil eden özellik
  const KalimbaString(
      {super.key,
      required this.height,
      required this.width,
      required this.number,

      this.dotNumber = 0}); // Default değer olarak 0

  @override
  State<KalimbaString> createState() => _KalimbaStringState();
}

class _KalimbaStringState extends State<KalimbaString> {
  bool isPressed = false;
  double elevation = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
          elevation = 8.0;
        });
      },
      onTapUp: (_)  {
         AudioService.playSound(widget.number);
        setState(() {
          isPressed = false;
          elevation = 0.0;
        });
      },
      onTapCancel: ()  {
         AudioService.playSound(widget.number);
        setState(() {
          isPressed = false;
          elevation = 0.0;
        });
      },
      child: Container(
        width: widget.width * 0.8,
        height: widget.height * 1.2,
        decoration: BoxDecoration(
          color: const Color(0xFFDDDDDD),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: elevation,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (int i = 0; i < widget.dotNumber; i++)
                  Container(
                    height: 8,
                    margin:const EdgeInsets.symmetric(vertical: 1),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                Text(widget.number.replaceAll("dot", "")),
              ],
            ),
            Container(
              width: widget.width,
              height: widget.height / 5,
              decoration: const BoxDecoration(
                color: Color(0xFFE8E8E8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
