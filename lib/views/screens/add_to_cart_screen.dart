import 'package:flutter/material.dart';
import 'package:shoes_ui/utils/colors.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
        centerTitle: true,
        backgroundColor: appBarColor,
        automaticallyImplyLeading: true,
      ),
    );
  }
}
