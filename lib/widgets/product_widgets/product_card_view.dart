import 'package:flutter/material.dart';
import 'package:shoes_ui/responsive/resizeScreen/build_mobile_view.dart';
import 'package:shoes_ui/responsive/resizeScreen/build_web_view.dart';

class ProductViewCard extends StatefulWidget {
  const ProductViewCard({Key? key}) : super(key: key);

  @override
  State<ProductViewCard> createState() => _ProductViewCardState();
}

class _ProductViewCardState extends State<ProductViewCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 768) {
            return const BuildWebView();
          } else {
            return const BuildMobileView();
          }
        },
      ),
    );
  }
}
