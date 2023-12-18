import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shoes_ui/provider/brand_build_provider.dart';

class BuildRatingBar extends StatefulWidget {
  const BuildRatingBar({super.key});

  @override
  State<BuildRatingBar> createState() => _BuildRatingBarState();
}

class _BuildRatingBarState extends State<BuildRatingBar> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<RatingProvider>(builder: (BuildContext context, value, child) {
    return RatingBar.builder(
      maxRating: 5.0,
      itemSize: 25.0,
      initialRating: value.initialRating,
      minRating: 0.0,
      allowHalfRating: false,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, index) {
        return const Icon(
          Icons.star,
          color: Colors.amber,
        );
      },
      onRatingUpdate: (updateRating) {
        value.rateProducts(updateRating);
      },
    );
  });
  }
}

