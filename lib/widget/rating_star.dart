import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final double value;
  const StarDisplay({super.key, this.value = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Stars
        ...List.generate(5, (index) {
          return Icon(
            color: Colors.orange,
            index < value ? Icons.star : Icons.star_border,
          );
        }),
        // Text value
        Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: AppText(
              text: value.toStringAsFixed(1),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
