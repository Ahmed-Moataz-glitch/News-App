import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/theme/app_colors.dart';


class CustomCarouselSliderImage extends StatefulWidget {
  final List<String> images;
  const CustomCarouselSliderImage({super.key, required this.images});

  @override
  State<CustomCarouselSliderImage> createState() => _CustomCarouselSliderImageState();
}

class _CustomCarouselSliderImageState extends State<CustomCarouselSliderImage> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.images.map((image) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(
              image,
              fit: BoxFit.contain,
              width: 1000.0,
              height: 280,
            ),
            // Positioned(
            //   bottom: 0.0,
            //   left: 0.0,
            //   right: 0.0,
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           Color.fromARGB(200, 0, 0, 0),
            //           Color.fromARGB(0, 0, 0, 0),
            //         ],
            //         begin: Alignment.bottomCenter,
            //         end: Alignment.topCenter,
            //       ),
            //     ),
            //     padding: const EdgeInsets.symmetric(
            //       vertical: 10.0,
            //       horizontal: 20.0,
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           '${article.source?.name ?? ''} . $publishedDate',
            //           style: const TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Text(
            //           article.title ?? '',
            //           maxLines: 2,
            //           overflow: TextOverflow.ellipsis,
            //           style: const TextStyle(
            //             color: Colors.white,
            //             fontSize: 20.0,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    }).toList();

    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 25.0 : 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: _current == entry.key
                      ? const BorderRadius.all(Radius.circular(8))
                      : null,
                  shape: _current == entry.key
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  color: _current == entry.key
                      ? AppColors.primary.withValues(alpha: 0.9)
                      : AppColors.black.withValues(alpha: 0.2),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
