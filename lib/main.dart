import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_ui/provider/brand_build_provider.dart';
import 'package:shoes_ui/responsive/mobile_screen.dart';
import 'package:shoes_ui/responsive/responsive_layout.dart';
import 'package:shoes_ui/responsive/web_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => BrandBuildProvider())),
        ChangeNotifierProvider(create: ((context) => FavoriteProducts())),
        ChangeNotifierProvider(create: ((context) => RatingProvider())),
        ChangeNotifierProvider(create: ((context) => AddtoProductList())),
        ChangeNotifierProvider(create: ((context) => ShoeSizeProvider())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ResponsiveLayout(
            webScreenLayout: WebScreen(), mobileScreenLayout: MobileScreen()),
      ),
    );
  }
}
