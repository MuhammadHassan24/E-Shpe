import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/view/bottomnavigation/navigationbar_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => NavigationBarModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: PopScope(
                canPop: viewModel.currentIndex == 0 ? true : false,
                onPopInvokedWithResult: (didPop, result) {
                  if (viewModel.currentIndex != 0) {
                    viewModel.setIndex(0);
                  } else {
                    viewModel.setIndex(0);
                  }
                },
                child: viewModel.getView(viewModel.currentIndex)),
            bottomNavigationBar: Theme(
              data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent),
              child: NavigationBar(
                height: 65,
                elevation: 0,
                backgroundColor: AppColors.cardBackgroundColors,
                indicatorColor: Colors.transparent,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: viewModel.currentIndex,
                destinations: [
                  const NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home_rounded),
                      label: "Home"),
                  const NavigationDestination(
                      selectedIcon: Icon(Icons.search_rounded),
                      icon: Icon(Icons.search_outlined),
                      label: "Search"),
                  const NavigationDestination(
                      selectedIcon: Icon(Icons.favorite_rounded),
                      icon: Icon(Icons.favorite_border_outlined),
                      label: "Wishlist"),
                  const NavigationDestination(
                      selectedIcon: Icon(Icons.person),
                      icon: Icon(Icons.person_outline),
                      label: "Account"),
                ],
                onDestinationSelected: (newIndex) {
                  viewModel.setIndex(newIndex);
                },
              ),
            ),
          );
        });
  }
}
