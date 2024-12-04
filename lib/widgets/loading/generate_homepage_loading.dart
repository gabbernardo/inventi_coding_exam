import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventi_coding_exam/utils/color/color_constants.dart';
import 'package:shimmer/shimmer.dart';

class GenerateHomepageLoading extends StatelessWidget {
  const GenerateHomepageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrand25,
      appBar: AppBar(
        leadingWidth: 48,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12),
          child: Shimmer.fromColors(
            baseColor: colorSecondary,
            highlightColor: colorBrand25,
            child: Container(
              color: colorSecondary,
              height: 36,
              width: 36,
            ),
          ),
        ),
        backgroundColor: colorBrand25,
        title: Shimmer.fromColors(
          baseColor: colorSecondary,
          highlightColor: colorBrand25,    
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              color: colorSecondary,
              width: 122.33,
              height: 36.62,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          height: 130,
          width: 369,
          decoration: BoxDecoration(
            color: colorSecondary,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorBrand100, width: 1.0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: 345,
                  height: 36,
                  decoration: BoxDecoration(
                    color: colorBrand25,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: colorSecondary,
                    highlightColor: colorBrand25,
                    child: Container(
                      height: 20,
                      width: 94,
                      color: colorSecondary,
                    ),
                  ),
                ),
              ),
              Container(
                height: 58,
                width: 345,
                decoration: BoxDecoration(
                  color: colorButton,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: CupertinoActivityIndicator(
                      radius: 16,
                      color: Colors.black,
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
