
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/constants/global_variables.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      direction: Axis.horizontal,
      rating: rating,
      itemSize: 15,
      itemBuilder: (context, index) {
        return const Icon(
          Icons.star,
          color: GlobalVariables.secondaryColor,
        );
      },
    );
  }
}
