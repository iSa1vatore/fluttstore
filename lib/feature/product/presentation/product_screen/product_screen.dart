import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';
import 'package:fluttstore/common/widgets/error_block.dart';
import 'package:fluttstore/feature/navigation/navigation.dart';
import 'package:fluttstore/feature/product/di/product_scope.dart';
import 'package:fluttstore/feature/product/presentation/product_screen/bloc/product_bloc.dart';
import 'package:fluttstore/feature/product/presentation/product_screen/widgets/product_details.dart';
import 'package:provider/provider.dart';

import 'widgets/product_images_carousel.dart';

class ProductScreen extends StatefulWidget implements AutoRouteWrapper {
  final int id;

  const ProductScreen({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => Provider(
        create: (_) => context.productScope.productBloc,
        child: this,
      );
}

class _ProductScreenState extends State<ProductScreen> {
  late final ProductBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.read<ProductBloc>();
    _bloc.add(ProductEvent.init(id: widget.id));
  }

  void openCartScreen() => context.router.push(const CartRoute());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: Text(context.l10n.productDetails),
        actions: [
          Button.primary(
            onPressed: openCartScreen,
            child: Assets.icons.cart.svg(),
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (_, state) => state.map(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          success: (state) => LayoutBuilder(
            builder: (_, constraints) => Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight / 2.4,
                  child: ProductImagesCarousel(state.product.images),
                ),
                Expanded(child: ProductDetails(state)),
              ],
            ),
          ),
          error: (_) => ErrorBlock(
            desc: context.l10n.errorLoadingProduct,
            onTryAgain: () => _bloc.add(ProductEvent.init(id: widget.id)),
          ),
        ),
      ),
    );
  }
}
