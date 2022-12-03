import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttstore/common/extensions/build_context.dart';

class ProductSpec extends StatelessWidget {
  final SvgPicture icon;
  final String value;

  const ProductSpec({
    required this.icon,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: Column(
        children: [
          icon,
          const Spacer(),
          Text(
            value,
            style: context.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
