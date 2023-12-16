import 'package:flutter/material.dart';
import 'package:shoes_ui/responsive/resizeScreen/popular_mobile_view.dart';
import 'package:shoes_ui/responsive/resizeScreen/popular_web_view.dart';

class PopularProductsDetails extends StatefulWidget {
  const PopularProductsDetails({super.key});

  @override
  State<PopularProductsDetails> createState() => _PopularProductsDetailsState();
}

class _PopularProductsDetailsState extends State<PopularProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 768) {
        return const PopularWebView();
      } else {
        return const PopularMobileView();
      }
    });
  }
}
