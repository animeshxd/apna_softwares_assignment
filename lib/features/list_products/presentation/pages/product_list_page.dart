import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_products_bloc.dart';
import '../widgets/product_tile.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductListView();
  }
}

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getNextProducts(context);
    _scrollController.addListener(
      () {
        double maxscroll = _scrollController.position.maxScrollExtent;
        double currentPixel = _scrollController.position.pixels;
        if (maxscroll == currentPixel) {
          _getNextProducts(context);
        }
      },
    );
  }

  _getNextProducts(BuildContext context) {
    context.read<ListProductsBloc>().add(const GetNextProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ListProductsBloc, ListProductsState>(
        listener: (context, state) {
          var messenger = ScaffoldMessenger.maybeOf(context);
          messenger?.clearSnackBars();

          if (state.products.isNotEmpty &&
              state is NextListProductsLoadFailed) {
            messenger?.showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          bool isLoading = state is NextListProductsLoading;

          if (state.products.isEmpty && state is NextListProductsLoaded) {
            return RefreshIndicator(
              onRefresh: () => _getNextProducts(context),
              child: const Center(child: Text('No Data Available')),
            );
          }
          if (state.products.isEmpty && state is NextListProductsLoadFailed) {
            return RefreshIndicator(
              onRefresh: () => _getNextProducts(context),
              child: Center(child: Text(state.message)),
            );
          }
          return ListView.builder(
            controller: _scrollController,
            itemCount: isLoading
                ? state.products.length + 1 //
                : state.products.length,
            itemBuilder: (context, index) {
              if (index == state.products.length) {
                return const LinearProgressIndicator();
              }
              var product = state.products[index];
              return ProductTile(product: product);
            },
          );
        },
      ),
    );
  }
}
