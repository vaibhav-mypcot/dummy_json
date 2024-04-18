import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/feature/products/data/product_model/product.dart';
import 'package:dummy_json/feature/products/presentation/bloc/product_bloc.dart';
import 'package:dummy_json/feature/products/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();

  List<Product> product = [];
  bool isLoading = false;
  bool isCircularProgressIndicator = false;

  @override
  void initState() {
    super.initState();
    setupScrollController();
    context.read<ProductBloc>().add(FetchProductDataEvent());
    // _dataBloc.add(FetchUsersEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context.read<ProductBloc>().add(FetchProductDataEvent());
          isCircularProgressIndicator = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => product.clear(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading && state.isFetchFirst) {
              print('product is in first fetch state');
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductLoading) {
              if (product.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              print('product is in loading state');
              product = state.oldProduct!;
              isLoading = true;
            } else if (state is ProductLoaded) {
              print('product is in loaded state');
              product = state.product!;
            } else if (state is ProductError) {
              print('product is in error state');

              print("Get error: ${state.errorMessage}");
            }

            return Container(
              // color: Colors.amberAccent,
              margin: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          // mainAxisExtent: 120.0,
                          mainAxisSpacing: 8.0,
                        ),
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: product.length + (isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < product.length) {
                            return GestureDetector(
                                onTap: () {},
                                child: ProductCard(
                                  item: product[index],
                                ));
                          } else {
                            Timer(const Duration(milliseconds: 30), () {
                              _scrollController.jumpTo(
                                  _scrollController.position.maxScrollExtent);
                            });
                            isCircularProgressIndicator = false;
                            return null;
                          }
                        }),
                  ),
                  isCircularProgressIndicator
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
