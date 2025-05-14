import 'package:ecommerceapp/view/screens/checkout/checkout_viewmodel.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/widget/app_button.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CheckOutView extends StatelessWidget {
  final List<Product> orderList;
  final int totalAmount;
  const CheckOutView(
      {super.key, required this.orderList, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CheckoutViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getSelectedAdress();
        },
        builder: (_, viewModel, child) {
          UserModel? data = viewModel.data;

          final subTotal = viewModel.shippingFee + totalAmount.abs();
          return Scaffold(
            persistentFooterAlignment: AlignmentDirectional.bottomCenter,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
              backgroundColor: AppColors.cardBackgroundColors,
              centerTitle: true,
              title: const AppText(
                text: "CheckOut",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: orderList.length >= 2 ? 190 : 90,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            final item = orderList[index];
                            return GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Container(
                                      height: 80,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: AppColors.cardBackgroundColors,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(item.image)),
                                  horizontalSpaceSmall,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: item.name,
                                        fontSize: 15,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      verticalspaceBetween,
                                      AppText(
                                        text: "\$${item.price}",
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (_, index) {
                            return const SizedBox(
                              height: 18,
                            );
                          },
                          itemCount: orderList.length),
                    ),
                    verticalSpaceMedium,
                    Container(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 14),
                      height: 375,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppText(
                                text: "Subtotal",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              AppText(
                                text: "\$${totalAmount.abs().toString()}",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Shipping Fee",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              AppText(
                                text: "\$${viewModel.shippingFee}",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Total",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              AppText(
                                text: "\$${subTotal}",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          verticalspaceBetween,
                          const Divider(),
                          verticalSpaceMedium,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Payment Method",
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                              ),
                              AppText(
                                text: "Change",
                                fontSize: 14,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              spacing: 15,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          255, 99, 118, 221)),
                                  child: const Center(
                                      child: Text(
                                    "S",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Text(
                                  "Stripe",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                          ),
                          verticalSpaceMedium,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Shipping Address",
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                              ),
                              AppText(
                                text: "Change",
                                fontSize: 14,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpaceSmall,
                              AppText(
                                text: data?.name ?? "",
                                fontSize: 15,
                              ),
                              verticalSpaceTiny,
                              Row(
                                spacing: 10,
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    color: Colors.black38,
                                  ),
                                  AppText(
                                      text: data?.number.toString() ?? "",
                                      fontSize: 15)
                                ],
                              ),
                              verticalSpaceTiny,
                              Row(
                                spacing: 10,
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black38,
                                  ),
                                  Expanded(
                                    child: Text(
                                      viewModel.selectedAddress.toString(),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: AppButton(
                onTap: () {
                  viewModel.stripeSer.makePayment(subTotal);
                },
                text: "Continue to payment",
                width: 280),
          );
        });
  }
}
