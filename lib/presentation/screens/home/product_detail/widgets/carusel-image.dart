import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/image.model.dart';
import 'package:yes/presentation/shared/colors.dart';

class CaruselProductImages extends StatefulWidget {
  const CaruselProductImages({Key? key, this.images}) : super(key: key);
  final List<ImageEntity>? images;

  @override
  State<CaruselProductImages> createState() => _CaruselProductImagesState();
}

class _CaruselProductImagesState extends State<CaruselProductImages> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Stack(
            children: [
              CarouselSlider(
                items: List.generate(
                  widget.images!.length,
                  (index) => SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      widget.images![index].getFullPathImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      activePage = index;
                    });
                  },
                  height: MediaQuery.of(context).size.height * .7,
                  viewportFraction: 1,
                  reverse: true,
                ),
              ),
            ],
          ),
        ),
        if (widget.images != null)
          Container(
            color: kWhite,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images!.length,
                (index) => buildIndicator(index),
              ),
            ),
          ),
      ],
    );
  }

  buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: activePage == index ? Colors.pinkAccent : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
