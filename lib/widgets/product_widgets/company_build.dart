import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_ui/models/brandModel.dart';
import 'package:shoes_ui/provider/brand_build_provider.dart';
import 'package:shoes_ui/utils/colors.dart';

class BuildCompanyBuilder extends StatefulWidget {
  const BuildCompanyBuilder({super.key});

  @override
  State<BuildCompanyBuilder> createState() => _BuildCompanyBuilderState();
}

class _BuildCompanyBuilderState extends State<BuildCompanyBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: products.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            return Consumer<BrandBuildProvider>(
              builder: (BuildContext context, value, child) {
                return GestureDetector(
                  onTap: () {
                    // value.read<BrandBuildProvider>().selectBrand();
                    value.selectBrand(index);
                  },
                  child: SizedBox(
                    width: 100,
                    child: Card(
                      elevation: 2,
                      color: value.selectedIndex == index
                          ? selectedColor
                          : Colors.white,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    products[index]['companyImageUrl'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
