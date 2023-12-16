import 'package:flutter/material.dart';
import 'package:shoes_ui/utils/colors.dart';
import 'package:shoes_ui/views/app_textStyle.dart';
import 'package:shoes_ui/widgets/product_widgets/popular_products_details.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    EdgeInsets contentPadding = screenWidth > 768
        ? const EdgeInsets.all(20.0)
        : const EdgeInsets.all(10.0);
    return Padding(
      padding: contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Most Popular',
              style: appStyle(textColor, FontWeight.bold, 18),
            ),
          ),
          const PopularProductsDetails(),
        ],
      ),
    );
  }
}
