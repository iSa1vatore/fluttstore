import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';

class CatalogSearchBar extends StatelessWidget {
  const CatalogSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 34,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withOpacity(.15),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.search,
                        color: context.theme.colorScheme.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Search',
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 34,
            height: 32,
            child: Button.primary(
              onPressed: () {},
              child: Assets.icons.qr.svg(),
              rounded: true,
            ),
          ),
        ],
      ),
    );
  }
}
