import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/view/screens/address/address_viewmodel.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddressViewModel(),
        onViewModelReady: (viewModel) async {
          viewModel.initialize();
          await viewModel.loadSelectedAddress();
        },
        builder: (_, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.cardBackgroundColors,
              title: const AppText(
                text: "Address",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            body: viewModel.addresses.isEmpty
                ? const Center(
                    child: Text("No Address Found"),
                  )
                : ListView.builder(
                    itemCount: viewModel.addresses.length,
                    itemBuilder: (_, index) {
                      final item = viewModel.addresses[index];
                      return InkWell(
                        onTap: () {
                          viewModel.removeAddress(index);
                        },
                        child: Container(
                          height: 90,
                          width: 290,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RadioMenuButton<String>(
                                value: item,
                                groupValue: viewModel.groupValue,
                                onChanged: (value) async {
                                  viewModel.groupValue = value.toString();
                                  await viewModel
                                      .saveSelectedAddress(value.toString());
                                  viewModel.rebuildUi();
                                },
                                child: SizedBox(
                                  width: 285,
                                  child: Text(
                                    item.toString(),
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.cardBackgroundColors,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Add Address"),
                        content: TextField(
                          controller: viewModel.fieldCon,
                          decoration:
                              const InputDecoration(hintText: "Enter Address"),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                await viewModel
                                    .addNewAddress(viewModel.fieldCon.text);
                                viewModel.navigator.back();
                              },
                              child: const Text(
                                "Add",
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      );
                    });
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          );
        });
  }
}
