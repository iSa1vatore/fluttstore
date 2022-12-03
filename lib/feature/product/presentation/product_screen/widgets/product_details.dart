import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/extensions/string.dart';
import 'package:fluttstore/common/ui_kit.dart';
import 'package:fluttstore/common/util/number_util.dart';

import '../bloc/product_bloc.dart';
import 'capacity_selector.dart';
import 'color_selector.dart';
import 'product_spec.dart';

class ProductDetails extends StatelessWidget {
  final ProductSuccessState state;

  const ProductDetails(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withOpacity(.16),
              blurRadius: 20,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 24,
            bottom: 8 + context.mediaQuery.viewPadding.bottom,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.product.title,
                          style: context.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        RatingBarIndicator(
                          rating: state.product.rating,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 18,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Button(
                      child: state.product.isFavorite
                          ? Assets.icons.likeFilled.svg(
                              width: 14,
                              height: 14,
                            )
                          : Assets.icons.like.svg(
                              color: Colors.white,
                              width: 14,
                              height: 14,
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  indicatorWeight: 3,
                  tabs: [
                    Tab(text: context.l10n.shop),
                    Tab(text: context.l10n.details),
                    Tab(text: context.l10n.features),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ProductSpec(
                                icon: Assets.icons.cpu.svg(),
                                value: state.product.cpu,
                              ),
                              ProductSpec(
                                icon: Assets.icons.camera.svg(),
                                value: state.product.camera,
                              ),
                              ProductSpec(
                                icon: Assets.icons.ram.svg(),
                                value: state.product.ram,
                              ),
                              ProductSpec(
                                icon: Assets.icons.storage.svg(),
                                value: state.product.storage,
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            context.l10n.selectColorAndCapacity,
                            style: context.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              ColorSelector(
                                colors: state.product.color
                                    .map((stringColor) => stringColor.toColor())
                                    .toList(),
                                selectedIndex: state.selectedColor,
                                onChanged: (i) => BlocProvider.of<ProductBloc>(
                                  context,
                                ).add(ProductEvent.changeColor(index: i)),
                              ),
                              const Spacer(),
                              CapacitySelector(
                                values: state.product.capacity,
                                selectedIndex: state.selectedCapacity,
                                onChanged: (i) => BlocProvider.of<ProductBloc>(
                                  context,
                                ).add(ProductEvent.changeCapacity(index: i)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(child: Text(context.l10n.details)),
                    Center(child: Text(context.l10n.features)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 54,
                  child: Button.primary(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          context.l10n.addToCart,
                          style: context.textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          r'$' + numberFormatter.format(state.product.price),
                          style: context.textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
