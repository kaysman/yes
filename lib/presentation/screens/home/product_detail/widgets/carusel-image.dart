import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/image.model.dart';

class CaruselProductImages extends StatelessWidget {
  const CaruselProductImages(
      {Key? key, required this.onPageCahnge, this.images})
      : super(key: key);
  final ValueChanged<int> onPageCahnge;
  final List<ImageEntity>? images;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          CarouselSlider(
            items: List.generate(
              images!.length,
              (index) => SizedBox(
                width: double.infinity,
                child: Image.network(
                  images![index].getFullPathImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            options: CarouselOptions(
              onPageChanged: (index, reason) => onPageCahnge.call(index),
              height: MediaQuery.of(context).size.height * .7,
              viewportFraction: 1,
              reverse: true,
            ),
          ),
        ],
      ),
    );
  }
}
