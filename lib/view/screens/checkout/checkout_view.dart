import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/view/screens/checkout/checkout_viewmodel.dart';
import 'package:ecommerceapp/widget/app_button.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/widget/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CheckOutView extends StatelessWidget {
  final List<Product> orderList;
  const CheckOutView({super.key, required this.orderList});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => CheckoutViewModel(),
        builder: (_, viewModel, child) {
          return Scaffold(
              persistentFooterAlignment: AlignmentDirectional.bottomCenter,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              appBar: AppBar(
                centerTitle: true,
                title: const AppText(
                  text: "CheckOut",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      verticalSpaceTiny,
                      const AppText(
                        text: "Shipping address",
                        fontSize: 16,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                      verticalSpaceSmall,
                      const Row(
                        children: [
                          CircleAvatar(
                              radius: 20,
                              child: Icon(
                                Icons.edit_location_rounded,
                                size: 28,
                              )),
                          horizontalSpaceSmall,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: "Home",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              verticalSpaceTiny,
                              AppText(
                                text: "--------------------------",
                                fontSize: 16,
                                color: AppColors.textColor,
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.edit)
                        ],
                      ),
                      verticalspaceBetween,
                      const AppText(
                        text: "Order List",
                        fontSize: 16,
                        color: AppColors.textColor,
                      ),
                      verticalspaceBetween,
                      ListView.separated(
                          itemCount: orderList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // padding: const EdgeInsets.all(10),
                          separatorBuilder: (context, index) => const Divider(
                                height: 35,
                                thickness: 2,
                                indent: 10,
                                endIndent: 10,
                              ),
                          itemBuilder: (_, index) {
                            Product data = orderList[index];
                            return CartTile(
                              data: data,
                              onDelete: () {},
                            );
                          }),
                    ],
                  ),
                ),
              ),
              persistentFooterButtons: [
                AppButton(
                    onTap: () {}, text: "Continue to payment", width: 280),
              ]);
        });
  }
}
