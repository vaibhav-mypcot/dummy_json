import 'dart:async';

import 'package:dummy_json/feature/products/data/product_model/product.dart';
import 'package:dummy_json/feature/products/presentation/bloc/product_bloc.dart';
import 'package:dummy_json/feature/products/presentation/widget/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductBloc _productBloc = ProductBloc();

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
    _productBloc.close();
    super.dispose();
  }

  void setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context.read<ProductBloc>().add(FetchProductDataEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading && state.isFetchFirst) {
            print('data in CircularProgressIndicator state');
            return const Center(child: CircularProgressIndicator());
          }
          List<Product> product = [];
          bool isLoading = false;
          if (state is ProductLoading) {
            print('data in ProductLoading state');
            product = state.oldProduct!;
            isLoading = true;
          } else if (state is ProductLoaded) {
            print('data in ProductLoaded state');
            product = state.product!;
          } else if (state is ProductError) {
            print("Get error: ${state.errorMessage}");
          }

          return Container(
            // color: Colors.amberAccent,
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              children: [
                const Text(
                  'Users Data',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: product.length + (isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        print('length: ${product.length}');
                        if (index < product.length) {
                          return ProductCard(
                            item: product[index],
                          );
                        } else {
                          // Timer(const Duration(milliseconds: 30), () {
                          //   _scrollController.jumpTo(
                          //       _scrollController.position.maxScrollExtent);
                          // });
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ],
            ),
          );

          // return Container(
          //   // color: Colors.amberAccent,
          //   margin: EdgeInsets.symmetric(horizontal: 20.h),
          //   child: Column(
          //     children: [
          //       GridView.builder(
          //           gridDelegate:
          //               const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             crossAxisSpacing: 8.0,
          //             // mainAxisExtent: 120.0,
          //             mainAxisSpacing: 8.0,
          //           ),
          //           shrinkWrap: true,
          //           controller: _scrollController,
          //           itemCount: product.length + (isLoading ? 1 : 0),
          //           itemBuilder: (context, index) {
          //             if (index < product.length) {
          //               return GestureDetector(
          //                   onTap: () {},
          //                   child: ProductCard(
          //                     item: product[index],
          //                   ));
          //             } else {
          //               Timer(const Duration(milliseconds: 30), () {
          //                 _scrollController.jumpTo(
          //                     _scrollController.position.maxScrollExtent);
          //               });
          //               return const Center(
          //                 child: CircularProgressIndicator(),
          //               );
          //             }
          //           }),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
