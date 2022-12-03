import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttstore/assets/theme/theme.dart';

class ProductImagesCarousel extends StatefulWidget {
  final List<String> images;

  const ProductImagesCarousel(
    this.images, {
    Key? key,
  }) : super(key: key);

  @override
  State<ProductImagesCarousel> createState() => _ProductImagesCarouselState();
}

class _ProductImagesCarouselState extends State<ProductImagesCarousel> {
  final pageController = PageController(
    viewportFraction: 0.6,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) => AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            var value = 1.0;

            if (pageController.position.haveDimensions) {
              value = pageController.page! - index;
              value = (1 - (value.abs() * .3)).clamp(0.0, 1.0);
            } else if (!pageController.position.haveDimensions && index != 0) {
              value = 0.7;
            }

            return Center(
              child: SizedBox(
                height: value * constraints.maxWidth,
                width: value * constraints.maxWidth,
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow.withOpacity(.16),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: widget.images[index],
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        itemCount: widget.images.length,
      ),
    );
  }
}
