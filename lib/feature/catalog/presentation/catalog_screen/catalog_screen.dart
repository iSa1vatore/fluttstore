import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';
import 'package:fluttstore/common/widgets/bottom_bar.dart';
import 'package:fluttstore/common/widgets/error_block.dart';
import 'package:fluttstore/feature/catalog/di/catalog_scope.dart';
import 'package:fluttstore/feature/catalog/presentation/catalog_screen/widgets/catalog_filters_modal.dart';
import 'package:fluttstore/feature/navigation/navigation.dart';

import '../../domain/model/catalog_category.dart';
import 'bloc/catalog_bloc.dart';
import 'widgets/catalog_category.dart';
import 'widgets/catalog_current_address.dart';
import 'widgets/catalog_header.dart';
import 'widgets/catalog_primary_item.dart';
import 'widgets/catalog_search_bar.dart';
import 'widgets/hot_sales_carousel.dart';

final categories = [
  CatalogCategory(id: 1, label: 'Phones', icon: Assets.icons.phone),
  CatalogCategory(id: 2, label: 'Computer', icon: Assets.icons.computer),
  CatalogCategory(id: 3, label: 'Health', icon: Assets.icons.health),
  CatalogCategory(id: 4, label: 'Books', icon: Assets.icons.books),
  CatalogCategory(id: 5, label: 'S.Toys', icon: Assets.icons.books),
];

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late final CatalogBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.catalogScope.catalogBloc;
    _bloc.add(const CatalogEvent.init());
  }

  void onItemPressed(int id) => context.router.push(ProductRoute(id: id));

  void onCategoryChanged(int id) => _bloc.add(CatalogEvent.changeCategory(id));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: const CatalogCurrentAddress(),
        actions: [
          Button.link(
            onPressed: () => showModalBottomSheet(
              barrierColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) => const CatalogFiltersModal(),
            ),
            child: Assets.icons.filter.svg(),
          ),
        ],
      ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        bloc: _bloc,
        builder: (context, state) => state.map(
          error: (_) => ErrorBlock(
            desc: context.l10n.errorLoadingCatalog,
            onTryAgain: () => _bloc.add(const CatalogEvent.init()),
          ),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          success: (state) => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 16),
                  child: CatalogHeader(
                    title: context.l10n.selectCategory,
                    actionLabel: context.l10n.viewAll,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => CatalogCategoryItem(
                      isSelected: categories[index].id == state.categoryId,
                      label: categories[index].label,
                      icon: categories[index].icon,
                      onPressed: () => onCategoryChanged(categories[index].id),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: CatalogSearchBar()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                    bottom: 8,
                    top: 18,
                  ),
                  child: CatalogHeader(
                    title: context.l10n.hotSales,
                    actionLabel: context.l10n.seeMore,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: HotSalesCarousel(
                  state.hotSales,
                  onItemPressed: onItemPressed,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  child: CatalogHeader(
                    title: context.l10n.bestSeller,
                    actionLabel: context.l10n.seeMore,
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: context.mediaQuery.viewPadding.bottom +
                      16 +
                      bottomBarHeight,
                ),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: .7,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => CatalogPrimaryItem(
                      state.bestSeller[index],
                      onItemPressed: onItemPressed,
                    ),
                    childCount: state.bestSeller.length,
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
