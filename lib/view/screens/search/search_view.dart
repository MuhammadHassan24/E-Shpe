import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/view/screens/search/search_viewmodel.dart';
import 'package:ecommerceapp/widget/app_textfield.dart';
import 'package:ecommerceapp/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.initailize(),
        onDispose: (viewModel) => viewModel.focusNode.dispose(),
        viewModelBuilder: () => SearchViewmodel(),
        builder: (_, viewModel, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpaceLarge,
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: OverflowBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppTextfield(
                            onChanged: (value) => viewModel.seacrh(value),
                            focusNode: viewModel.focusNode,
                            contentPadding: const EdgeInsets.all(10),
                            controller: viewModel.searchController,
                            hintText: "Search"),
                        PopupMenuButton(
                            icon: Image.asset("asset/images/filter.png"),
                            itemBuilder: (_) {
                              return [
                                PopupMenuItem(
                                  onTap: () => viewModel.lowToHigh(),
                                  child: const Text("Low to high"),
                                ),
                                const PopupMenuItem(
                                  child: Text("High to low"),
                                )
                              ];
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: viewModel.searchController.text.isEmpty
                        ? const Center(
                            child: Text(""),
                          )
                        : viewModel.result.isEmpty
                            ? const Center(
                                child: Text("Result Not Found"),
                              )
                            : GridView.builder(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 183,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        crossAxisCount: 2),
                                itemCount: viewModel.result.length,
                                itemBuilder: (_, index) {
                                  Product data = viewModel.result[index];
                                  return ProductCard(
                                    onTap: () {
                                      viewModel.navigateToDetail(data);
                                    },
                                    data: data,
                                  );
                                }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
