import 'package:flutter/material.dart';
import 'package:final_project/constant.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget(
      {super.key,
      required this.imageSrc,
      required this.height,
      required this.width,
      this.radius = 0.0,
      });

  final String imageSrc;
  final double height;
  final double width;
  final double radius;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        '${Constant.image_urlw}$imageSrc',
        height: height,
        width: width,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          return Container(
            height: height,
            width: width,
            color: Colors.amber,
            child: child,
          );
        },
        errorBuilder: (_, __, ___) {
          return SizedBox(
            height: height,
            width: width,
            child: Icon(
              Icons.broken_image_rounded,
            ),
          );
        },
      ),
    );
  }
}
