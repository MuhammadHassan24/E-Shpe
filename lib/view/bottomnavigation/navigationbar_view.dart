import 'package:animations/animations.dart';
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
            body: PageTransitionSwitcher(
              reverse: viewModel.reverse,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.vertical,
                  child: child,
                );
              },
              child: PopScope(
                  canPop: viewModel.currentIndex == 0 ? true : false,
                  onPopInvokedWithResult: (didPop, result) {
                    if (viewModel.currentIndex != 0) {
                      viewModel.rebuildUi();
                      viewModel.setIndex(0);
                    } else {
                      viewModel.setIndex(0);
                    }
                  },
                  child: viewModel.getView(viewModel.currentIndex)),
            ),
            bottomNavigationBar: Theme(
              data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent),
              child: NavigationBar(
                height: 70,
                elevation: 0,
                indicatorColor: Colors.transparent,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: viewModel.currentIndex,
                destinations: [
                  NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home_rounded),
                      label: "Home"),
                  NavigationDestination(
                      selectedIcon: Icon(Icons.search_rounded),
                      icon: Icon(Icons.search_outlined),
                      label: "Search"),
                  NavigationDestination(
                      selectedIcon: Icon(Icons.shopping_cart_rounded),
                      icon: Stack(children: [
                        Icon(Icons.shopping_cart_outlined),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor:
                                viewModel.cartServices.addCartItems.isEmpty
                                    ? Colors.transparent
                                    : Colors.red,
                          ),
                        ),
                      ]),
                      label: "Cart"),
                  NavigationDestination(
                      selectedIcon: Icon(Icons.favorite_rounded),
                      icon: Icon(Icons.favorite_border_outlined),
                      label: "Wishlist"),
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
